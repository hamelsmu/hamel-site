## Q: What parts of evals can be automated with LLMs?

LLMs can speed up parts of your eval workflow, but they can't replace human judgment where your expertise is essential. For example, if you let an LLM handle all of [error analysis](why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.qmd){target="_blank"} (i.e., reviewing and annotating traces), you might overlook failure cases that matter for your product. Suppose users keep mentioning "lag" in feedback, but the LLM lumps these under generic "performance issues" instead of creating a "latency" category. You'd miss a recurring complaint about slow response times and fail to prioritize a fix.

That said, LLMs are valuable tools for accelerating certain parts of the evaluation workflow *when used with oversight*. 

### Here are some areas where LLMs can help:

* **First-pass axial coding:** After you've open coded 30–50 traces yourself, use an LLM to organize your raw failure notes into proposed groupings. This helps you quickly spot patterns, but always review and refine the clusters yourself.  _Note: If you aren't familiar with axial and open coding, see [this faq](why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.qmd){target="_blank"}._
* **Mapping annotations to failure modes:** Once you've defined failure categories, you can ask an LLM to suggest which categories apply to each new trace (e.g., "Given this annotation: \[open\_annotation\] and these failure modes: \[list\_of\_failure\_modes\], which apply?").  
* **Suggesting prompt improvements:** When you notice recurring problems, have the LLM propose concrete changes to your prompts. Review these suggestions before adopting any changes.  
* **Analyzing annotation data:** Use LLMs or AI-powered notebooks to find patterns in your labels, such as "reports of lag increase 3x during peak usage hours" or "slow response times are mostly reported from users on mobile devices."

### However, you shouldn't outsource these activities to an LLM:

* **Initial open coding:** Always read through the raw traces yourself at the start. This is how you discover new types of failures, understand user pain points, and build intuition about your data. Never skip this or delegate it.  
* **Validating failure taxonomies:** LLM-generated groupings need your review. For example, an LLM might group both "app crashes after login" and "login takes too long" under a single "login issues" category, even though one is a stability problem and the other is a performance problem. Without your intervention, you'd miss that these issues require different fixes.  
* **Ground truth labeling:** For any data used for testing/validating LLM-as-Judge evaluators, hand-validate each label. LLMs can make mistakes that lead to unreliable benchmarks.  
* **Root cause analysis:** LLMs may point out obvious issues, but only human review will catch patterns like errors that occur in specific workflows or edge cases—such as bugs that happen only when users paste data from Excel.

In conclusion, start by examining data manually to understand what's actually going wrong. Use LLMs to scale what you've learned, not to avoid looking at data.

[↗ Focus view](/blog/posts/evals-faq/what-parts-of-evals-can-be-automated-with-llms.html){.faq-individual-link}