## Q: How can I efficiently sample production traces for review? [↗](/blog/posts/evals-faq/how-can-i-efficiently-sample-production-traces-for-review.html){.faq-link-icon}

It can be cumbersome to review traces randomly, especially when most traces don't have an error. These sampling strategies help you find traces more likely to reveal problems:

- **Outlier detection:** Sort by any metric (response length, latency, tool calls) and review extremes.
- **User feedback signals:** Prioritize traces with negative feedback, support tickets, or escalations.
- **Metric-based sorting:** Generic metrics can serve as exploration signals to find interesting traces. Review both high and low scores and treat them as exploration clues. Based on what you learn, you can build custom evaluators for the failure modes you find.
- **Stratified sampling:** Group traces by key dimensions (user type, feature, query category) and sample from each group.

As you get more sophisticated with how you sample, you can incorporate these tactics into the design of your [annotation tools](/blog/posts/evals-faq/what-makes-a-good-custom-interface-for-reviewing-llm-outputs.html).

[↩ Back to main FAQ](/blog/posts/evals-faq/#q-how-can-i-efficiently-sample-production-traces-for-review){.faq-back-link}