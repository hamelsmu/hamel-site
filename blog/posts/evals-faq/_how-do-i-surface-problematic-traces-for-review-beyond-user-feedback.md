## Q: How do I surface problematic traces for review beyond user feedback?

While user feedback is a good way to narrow in on problematic traces, other methods are also useful. Here are three complementary approaches:

### Start with random sampling

The simplest approach is reviewing a random sample of traces. If you find few issues, escalate to stress testing: create queries that deliberately test your prompt constraints to see if the AI follows your rules. 

### Use evals for initial screening

Use existing evals to find problematic traces and potential issues. Once you've identified these, you can proceed with the typical evaluation process starting with [error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed).

### Leverage efficient sampling strategies

For more sophisticated trace discovery, [use outlier detection, metric-based sorting, and stratified sampling](#q-how-can-i-efficiently-sample-production-traces-for-review) to find interesting traces. [Generic metrics can serve as exploration signals](#q-should-i-use-ready-to-use-evaluation-metrics) to identify traces worth reviewing, even if they don't directly measure quality.

[↗ Focus view](/blog/posts/evals-faq/how-do-i-surface-problematic-traces-for-review-beyond-user-feedback.html){.faq-individual-link}