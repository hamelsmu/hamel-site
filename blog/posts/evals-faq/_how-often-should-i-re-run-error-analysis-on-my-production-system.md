## Q: How often should I re-run error analysis on my production system?

Re-run comprehensive [error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed) when making significant changes: new features, prompt updates, model switches, or major bug fixes. During active development, this means every 2-4 weeks. Each analysis should review 100+ fresh traces to catch new failure modes.

Between major analyses, review 10-20 traces weekly, focusing on outliers: unusually long conversations, sessions with multiple retries, or traces flagged by automated monitoring. Weekly reviews can catch issues like prompt changes causing hallucinations before they affect customers.

Adjust frequency based on system stability and usage growth. New systems need weekly analysis until failure patterns stabilize. Mature systems might need only monthly analysis unless usage patterns change. Always analyze after incidents, user complaint spikes, or metric drift. Scaling usage introduces new edge cases. [↗](/blog/posts/evals-faq/how-often-should-i-re-run-error-analysis-on-my-production-system.html){.faq-individual-link}
