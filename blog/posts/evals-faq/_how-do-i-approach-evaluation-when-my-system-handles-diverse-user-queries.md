## Q: How do I approach evaluation when my system handles diverse user queries?

> Complex applications often support vastly different query patterns—from "What's the return policy?" to "Compare pricing trends across regions for products matching these criteria." Each query type exercises different system capabilities, leading to confusion on how to design eval criteria.

**_[Error Analysis](https://youtu.be/e2i6JbU2R-s?si=8p5XVxbBiioz69Xc) is all you need._** Your evaluation strategy should emerge from observed failure patterns (e.g. error analysis), not predetermined query classifications. Rather than creating a massive evaluation matrix covering every query type you can imagine, let your system's actual behavior guide where you invest evaluation effort.

During error analysis, you'll likely discover that certain query categories share failure patterns. For instance, all queries requiring temporal reasoning might struggle regardless of whether they're simple lookups or complex aggregations. Similarly, queries that need to combine information from multiple sources might fail in consistent ways. These patterns discovered through error analysis should drive your evaluation priorities.  It could be that query category is a fine way to group failures, but you don't know that until you've analyzed your data.

To see an example of basic error analysis in action, [see this video](https://youtu.be/e2i6JbU2R-s?si=8p5XVxbBiioz69Xc).

<hr>
<div class="cta" style="text-align: center;">
<strong>👉 <em>We are teaching our last and final cohort of our [AI Evals course](https://bit.ly/evals-ai) next month</strong> (we have to get back to building). Here is a [35% discount code](https://bit.ly/evals-ai) for readers.</em> 👈
</div>
<hr> [↗](/blog/posts/evals-faq/how-do-i-approach-evaluation-when-my-system-handles-diverse-user-queries.html){.faq-individual-link}