## Q: How can I efficiently sample production traces for review?

It can be cumbersome to review traces randomly, especially when most traces don't have an error. These sampling strategies help you find traces more likely to reveal problems:

- **Outlier detection:** Sort by any metric (response length, latency, tool calls) and review extremes.
- **User feedback signals:** Prioritize traces with negative feedback, support tickets, or escalations.
- **Metric-based sorting:** Generic metrics can serve as exploration signals to find interesting traces. Review both high and low scores and treat them as exploration clues. Based on what you learn, you can build custom evaluators for the failure modes you find.
- **Stratified sampling:** Group traces by key dimensions (user type, feature, query category) and sample from each group.
- **Embedding clustering:** Generate embeddings of queries and cluster them to reveal natural groupings. Sample proportionally from each cluster, but oversample small clusters for edge cases. There's no right answer for clustering—it's an exploration technique to surface patterns you might miss manually.

As you get more sophisticated with how you sample, you can incorporate these tactics into the design of your [annotation tools](#q-what-makes-a-good-custom-interface-for-reviewing-llm-outputs){target="_blank"}.

[↗ Focus view](/blog/posts/evals-faq/how-can-i-efficiently-sample-production-traces-for-review.html){.faq-individual-link}