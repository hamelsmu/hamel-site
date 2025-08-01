## Q: What gaps in eval tooling should I be prepared to fill myself?

Most eval tools handle the basics well: logging complete traces, tracking metrics, prompt playgrounds, and annotation queues. These are table stakes. Here are four areas where you'll likely need to supplement existing tools. 

Watch for vendors addressing these gaps: it's a strong signal they understand practitioner needs.

### 1. Error Analysis and Pattern Discovery

After reviewing traces where your AI fails, can your tooling automatically cluster similar issues? For instance, if multiple traces show the assistant using casual language for luxury clients, you need something that recognizes this broader "persona-tone mismatch" pattern. We recommend building capabilities that use AI to suggest groupings, rewrite your observations into clearer failure taxonomies, help find similar cases through semantic search, etc.

### 2. AI-Powered Assistance Throughout the Workflow

The most effective workflows use AI to accelerate every stage of evaluation. During error analysis, you want an LLM helping categorize your open-ended observations into coherent failure modes. For example, you might annotate several traces with notes like "wrong tone for investor," "too casual for luxury buyer," etc. Your tooling should recognize these as the same underlying pattern and suggest a unified "persona-tone mismatch" category.

You'll also want AI assistance in proposing fixes. After identifying 20 cases where your assistant omits pet policies from property summaries, can your workflow analyze these failures and suggest specific prompt modifications? Can it draft refinements to your SQL generation instructions when it notices patterns of missing WHERE clauses? 

Additionally, good workflows help you conduct data analysis of your annotations and traces.  I like using notebooks with AI in-the-loop like [Julius](https://julius.ai/){target="_blank"},[Hex](https://hex.tech){target="_blank"} or [SolveIt](https://solveit.fast.ai/){target="_blank"}.  These help me discover insights like "location ambiguity errors spike 3x when users mention neighborhood names" or "tone mismatches occur 80% more often in email generation than other modalities."

### 3. Custom Evaluators Over Generic Metrics

Be prepared to build most of your evaluators from scratch. Generic metrics like "hallucination score" or "helpfulness rating" rarely capture what actually matters for your application—like proposing unavailable showing times or omitting budget constraints from emails. In our experience, successful teams spend most of their effort on application-specific metrics.

### 4. APIs That Support Custom Annotation Apps

Custom annotation interfaces [work best for most teams](#q-should-i-build-a-custom-annotation-tool-or-use-something-off-the-shelf){target="_blank"}. This requires observability platforms with thoughtful APIs. I often have to build my own libraries and abstractions just to make bulk data export manageable. You shouldn't have to paginate through thousands of requests or handle timeout-prone endpoints just to get your data. Look for platforms that provide true bulk export capabilities and, crucially, APIs that let you write annotations back efficiently.

[↗ Focus view](/blog/posts/evals-faq/what-gaps-in-eval-tooling-should-i-be-prepared-to-fill-myself.html){.faq-individual-link}