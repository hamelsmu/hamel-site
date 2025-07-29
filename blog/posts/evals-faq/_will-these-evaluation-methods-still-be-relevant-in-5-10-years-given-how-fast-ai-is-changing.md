## Q: Will today's evaluation methods still be relevant in 5-10 years given how fast AI is changing?

Yes. Even with perfect models, you still need to verify they're solving the right problem. The need for systematic [error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed){target="_blank"}, domain-specific testing, and monitoring will still be important.

Today's prompt engineering tricks might become obsolete, but you'll still need to understand failure modes.  Additionally, a LLM cannot read your mind, and [research shows](https://arxiv.org/abs/2404.12272){target="_blank"} that people need to observe the LLM's behavior in order to properly externalize their requirements.

For deeper perspective on this debate, see these two viewpoints: ["The model is the product"](https://m.youtube.com/watch?si=qknrtQeITqJ7VsJH&v=4dUFIRj-BWo&feature=youtu.be){target="_blank"} versus ["The model is NOT the product"](https://www.youtube.com/watch?v=EEw2PpL-_NM){target="_blank"}.

::: {.content-visible unless-format="pdf"}
**"The model is the product":**
{{< video https://www.youtube.com/watch?v=4dUFIRj-BWo >}}

**"The model is NOT the product":**
{{< video https://www.youtube.com/watch?v=EEw2PpL-_NM >}}
:::

[↗](/blog/posts/evals-faq/will-these-evaluation-methods-still-be-relevant-in-5-10-years-given-how-fast-ai-is-changing.html){.faq-individual-link}