## Q: What's a minimum viable evaluation setup?

Start with [error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed){target="_blank"}, not infrastructure. Spend 30 minutes manually reviewing 20-50 LLM outputs whenever you make significant changes. Use one [domain expert](#q-how-many-people-should-annotate-my-llm-outputs){target="_blank"} who understands your users as your quality decision maker (a "[benevolent dictator](#q-how-many-people-should-annotate-my-llm-outputs){target="_blank"}").

If possible, **use notebooks** to help you review traces and analyze data. In our opinion, this is the single most effective tool for evals because you can write arbitrary code, visualize data, and iterate quickly. You can even build your own [custom annotation interface](#q-what-makes-a-good-custom-interface-for-reviewing-llm-outputs){target="_blank"} right inside notebooks, as shown in this [video](https://youtu.be/aqKUwPKBkB0?si=5KDmMQnRzO_Ce9xH){target="_blank"}.

::: {.content-visible unless-format="pdf"}
{{< video https://www.youtube.com/watch?v=aqKUwPKBkB0 >}}
:::

[↗ Focus view](/blog/posts/evals-faq/whats-a-minimum-viable-evaluation-setup.html){.faq-individual-link}