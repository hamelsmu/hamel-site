## Q: Should I use \"ready-to-use\" evaluation metrics?

**No. Generic evaluations waste time and create false confidence.** (Unless you're using them for exploration). 

One instructor noted: 

> "All you get from using these prefab evals is you don't know what they actually do and in the best case they waste your time and in the worst case they create an illusion of confidence that is unjustified."[^1]

Generic evaluation metrics are everywhere. Eval libraries contain scores like helpfulness, coherence, quality, etc. promising easy evaluation. These metrics measure abstract qualities that may not matter for your use case. Good scores on them don't mean your system works.

Instead, conduct [error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed){target="_blank"} to understand failures. Define [binary failure modes](#q-why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales){target="_blank"} based on real problems. Create [custom evaluators](#q-should-i-build-automated-evaluators-for-every-failure-mode-i-find){target="_blank"} for those failures and validate them against human judgment. Essentially, the entire evals process.

Experienced practitioners may still use these metrics, just not how you'd expect. As Picasso said: "Learn the rules like a pro, so you can break them like an artist." Once you understand why generic metrics fail as evaluations, you can repurpose them as exploration tools to [find interesting traces](#q-how-can-i-efficiently-sample-production-traces-for-review){target="_blank"} (explained in the next FAQ). [↗](/blog/posts/evals-faq/should-i-use-ready-to-use-evaluation-metrics.html){.faq-individual-link}

[^1]: [Eleanor Berger](https://www.linkedin.com/in/intellectronica/){target="_blank"}, our wonderful TA.