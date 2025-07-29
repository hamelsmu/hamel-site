## Q: What should go in the system prompt vs. the user prompt?

**Nothing beats experimentation.** Test both approaches (ideally with evals) with your specific model and use case. Models handle system and user prompts differently, and these differences vary by provider and model version. Move instructions between prompts and measure which produces better results for your specific task.

**General guidelines:** Put static instructions and role definitions in the system prompt. Put dynamic content, examples, and task-specific details in the user prompt. Think of the system prompt as the model's constitution—rules that apply across all requests. Include identity, behavioral constraints, output format requirements, and standing instructions: "You are a medical assistant. Never provide diagnoses. Always recommend consulting a healthcare provider."

The user prompt contains the actual task, relevant context, few-shot examples, and data to process. Documents for analysis, query-specific variations, and contextual information belong here. When the distinction feels unclear, prefer the user prompt. It's more portable across models and easier to debug.

[↗ Focus view](/blog/posts/evals-faq/what-should-go-in-the-system-prompt-vs-the-user-prompt.html){.faq-individual-link}