## Q: Are similarity metrics (BERTScore, ROUGE, etc.) useful for evaluating LLM outputs?

Generic metrics like BERTScore, ROUGE, cosine similarity, etc. are not useful for evaluating LLM outputs in most AI applications. Instead, we recommend using [error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed){target="_blank"} to identify metrics specific to your application's behavior. We recommend designing [binary pass/fail](#q-why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales){target="_blank"}.) evals (using LLM-as-judge) or code-based assertions.

As an example, consider a real estate CRM assistant. Suggesting showings that aren't available (can be tested with an assertion) or confusing client personas (can be tested with a LLM-as-judge) is problematic . Generic metrics like similarity or verbosity won't catch this. A relevant quote from the course:

> "The abuse of generic metrics is endemic. Many eval vendors promote off the shelf metrics, which ensnare engineers into superfluous tasks."

Similarity metrics aren't always useless. They have utility in domains like search and recommendation (and therefore can be useful for [optimizing and debugging retrieval](#q-how-should-i-approach-evaluating-my-rag-system){target="_blank"} for RAG). For example, cosine similarity between embeddings can measure semantic closeness in retrieval systems, and average pairwise similarity can assess output diversity (where lower similarity indicates higher diversity).

[↗ Focus view](/blog/posts/evals-faq/are-similarity-metrics-bertscore-rouge-etc-useful-for-evaluating-llm-outputs.html){.faq-individual-link}