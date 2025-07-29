## Q: Should I practice eval-driven development?

**Generally no.** Eval-driven development (writing evaluators before implementing features) sounds appealing but creates more problems than it solves. Unlike traditional software where failure modes are predictable, LLMs have infinite surface area for potential failures. You can't anticipate what will break.

A better approach is to start with [error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed). Write evaluators for errors you discover, not errors you imagine. This avoids getting blocked on what to evaluate and prevents wasted effort on metrics that have no impact on actual system quality.

**Exception:** Eval-driven development may work for specific constraints where you know exactly what success looks like. If adding "never mention competitors," writing that evaluator early may be acceptable.

Most importantly, always do a [cost-benefit analysis](#q-should-i-build-automated-evaluators-for-every-failure-mode-i-find) before implementing an eval. Ask whether the failure mode justifies the investment. Error analysis reveals which failures actually matter for your users.

[↗](/blog/posts/evals-faq/should-i-practice-eval-driven-development.html){.faq-individual-link}