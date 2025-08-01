## Q: Can I use the same model for both the main task and evaluation?

For LLM-as-Judge selection, using the same model is usually fine because the judge is doing a different task than your main LLM pipeline. The judges we recommend building do [scoped binary classification tasks](#q-why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales){target="_blank"}. Focus on achieving high True Positive Rate (TPR) and True Negative Rate (TNR) with your judge on a held out labeled test set rather than avoiding the same model family.  You can use these metrics on the test set to understand how well your judge is doing.

When selecting judge models, start with the most capable models available to establish strong alignment with human judgments. You can optimize for cost later once you've established reliable evaluation criteria. We do not recommend using the same model for open ended preferences or response quality (but we don't recommend building judges this way in the first place!).

[↗ Focus view](/blog/posts/evals-faq/can-i-use-the-same-model-for-both-the-main-task-and-evaluation.html){.faq-individual-link}