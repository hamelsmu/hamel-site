## Q: How often should I re-run error analysis on my production system?

Re-run [error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed) when making significant changes: new features, prompt updates, model switches, or major bug fixes. A useful heuristic is to set a goal for reviewing _at least_ 100+ fresh traces each review cycle.  Typical review cycles we've seen range from 2-4 weeks.  See [this FAQ](#q-how-can-i-efficiently-sample-production-traces-for-review){target="_blank"} on how to sample traces effectively.

Between major analyses, review 10-20 traces weekly, focusing on outliers: unusually long conversations, sessions with multiple retries, or traces flagged by automated monitoring. Adjust frequency based on system stability and usage growth. New systems need weekly analysis until failure patterns stabilize. Mature systems might need only monthly analysis unless usage patterns change. Always analyze after incidents, user complaint spikes, or metric drift. Scaling usage introduces new edge cases.

[↗ Focus view](/blog/posts/evals-faq/how-often-should-i-re-run-error-analysis-on-my-production-system.html){.faq-individual-link}