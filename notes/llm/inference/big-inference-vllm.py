# from https://modal.com/docs/guide/ex/vllm_inference
import os
from modal import Image, Secret, Stub, method, gpu

NUM_GPUS = 4
def download_model_to_folder():
    from huggingface_hub import snapshot_download

    snapshot_download(
        "meta-llama/Llama-2-70b-chat-hf",
        local_dir="/model",
        token=os.environ["HUGGINGFACE_TOKEN"],
    )

image = (
    Image.from_dockerhub("nvcr.io/nvidia/pytorch:22.12-py3")
    .pip_install("torch==2.0.1", index_url="https://download.pytorch.org/whl/cu118")
    # Pin vLLM to 8/2/2023
    .pip_install("vllm @ git+https://github.com/vllm-project/vllm.git@79af7e96a0e2fc9f340d1939192122c3ae38ff17")
    .pip_install("wandb")
    # Use the barebones hf-transfer package for maximum download speeds. No progress bar, but expect 700MB/s.
    .pip_install("hf-transfer~=0.1")
    .pip_install("GPUtil", force_build=True)
    .run_function(
        download_model_to_folder,
        secret=Secret.from_name("my-huggingface-secret"),
        timeout=60 * 20)
)

stub = Stub("example-vllm-inference", image=image)
@stub.cls(gpu=gpu.A100(count=NUM_GPUS, memory=40), secrets=[Secret.from_name("my-huggingface-secret"),
                                                 Secret.from_name("wandb")])
class Model:
    def __enter__(self):
        import wandb
        from vllm import LLM
        import torch
        import json
        import GPUtil
        
        gpus = GPUtil.getGPUs()

        with open("/model/config.json") as f:
            config = json.load(f)
        model_nm = config["_name_or_path"]

        wandb_enabled = bool(os.environ.get("WANDB_API_KEY"))
        if wandb_enabled:
            wandb.init(
                id=stub.app.app_id,
                project='llama-inference',
                entity='hamelsmu')
            wandb.run.summary["num_gpus"] = len(gpus)
            wandb.run.summary["model"] = model_nm
            wandb.run.summary["GPU"] = gpus[0].name
            wandb.run.log_code()
        
        cfg = {"model": model_nm, "num_gpus": len(gpus)}
        if wandb.run:
            wandb.run.config.update(cfg)

        torch.cuda.empty_cache() 
        self.llm = LLM("/model", tensor_parallel_size=len(gpus))
        self.template = """SYSTEM: You are a helpful assistant.
USER: {}
ASSISTANT: """
        print("Loaded model")

    @method()
    def generate(self, user_questions):
        from vllm import SamplingParams
        import wandb, time
        out_table = wandb.Table(columns=["question", "answer", "num_tokens"])

        prompts = [self.template.format(q) for q in user_questions]
        sampling_params = SamplingParams(
            temperature=0.75,
            top_p=1,
            max_tokens=800,
            presence_penalty=1.15,
        )
        
        start = time.perf_counter()
        result = self.llm.generate(prompts, sampling_params)
        request_time = time.perf_counter() - start
        
        num_tokens = 0
        for output in result:
            num_tokens += len(output.outputs[0].token_ids)
            print(output.prompt, output.outputs[0].text, "\n\n", sep="")
            out_table.add_data(output.prompt, output.outputs[0].text, len(output.outputs[0].token_ids))
    
        if wandb.run:
            wandb.run.log({'outputs': out_table})
            wandb.run.summary["response_time"] = request_time
            wandb.run.summary["num_tokens"] = num_tokens
            wandb.run.summary["tok/sec"] = num_tokens / request_time

        print(f"Generated {num_tokens} tokens")

# ## Run the model
# We define a [`local_entrypoint`](/docs/guide/apps#entrypoints-for-ephemeral-apps) to call our remote function
# sequentially for a list of inputs. You can run this locally with `modal run vllm_inference.py`.
@stub.local_entrypoint()
def main():
    model = Model()
    from questions import questions
    model.generate.call(questions)
