## Q: How do I evaluate complex multi-step workflows?

Log the entire workflow from initial trigger to final business outcome. Include LLM calls, tool usage, human approvals, and database writes in your traces. You will need this visibility to properly diagnose failures.

Use both outcome and process metrics. Outcome metrics verify the final result meets requirements: Was the business case complete? Accurate? Properly formatted? Process metrics evaluate efficiency: step count, time taken, resource usage. Process failures are often easier to debug since they're more deterministic, so tackle them first.

Segment your [error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed) by workflow stages. Early stage failures (understanding user input) differ from middle stage failures (data processing) and late stage failures (formatting output). Early stage improvements have more impact since errors cascade in LLM chains.

Use [transition failure matrices](#q-how-do-i-evaluate-agentic-workflows) to analyze where workflows break. Create a matrix showing the last successful state versus where the first failure occurred. This reveals failure hotspots and guides where to invest debugging effort.

[↗ Focus view](/blog/posts/evals-faq/how-do-i-evaluate-complex-multi-step-workflows.html){.faq-individual-link}