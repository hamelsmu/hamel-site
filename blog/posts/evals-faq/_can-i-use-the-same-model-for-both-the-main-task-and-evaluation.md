## Q: Can I use the same model for both the main task and evaluation?

For LLM-as-Judge selection, using the same model is usually fine because the judge is doing a different task than your main LLM pipeline. While [research has shown](https://arxiv.org/pdf/2508.06709) that models can exhibit bias when evaluating their own outputs, what ultimately matters is how well your judge aligns with human judgments. The judges we recommend building do [scoped binary classification tasks](#q-why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales){target="_blank"}.  We've found that iterative alignment with human labels is usually achievable on this constrained task. 

Focus on achieving high True Positive Rate (TPR) and True Negative Rate (TNR) with your judge on a held out labeled test set. If you struggle to achieve good alignment with human scores, then consider trying a different model. However onboarding new model providers may involve non-trivial effort in some organizations, which is why we don't advocate for using different models by default unless there's a specific alignment issue.

When selecting judge models, start with the most capable models available to establish strong alignment with human judgments. You can optimize for cost later once you've established reliable evaluation criteria.

[↗ Focus view](/blog/posts/evals-faq/can-i-use-the-same-model-for-both-the-main-task-and-evaluation.html){.faq-individual-link}