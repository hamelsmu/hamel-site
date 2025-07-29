## Q: Should product managers and engineers collaborate on error analysis? How?

At the outset, collaborate to establish shared context. Engineers catch technical issues like retrieval issues and tool errors. PMs identify product failures like unmet user expectations, confusing responses, or missing features users expect.

As time goes on you should lean towards a [benevolent dictator](#q-how-many-people-should-annotate-my-llm-outputs) for error analysis: a domain expert or PM who understands user needs. Empower domain experts to evaluate actual outcomes rather than technical implementation. Ask "Has an appointment been made?" not "Did the tool call succeed?" The best way to empower the domain expert is to give them [custom annotation tools](#q-what-makes-a-good-custom-interface-for-reviewing-llm-outputs) that display system outcomes alongside traces. Show the confirmation, generated email, or database update that validates goal completion. Keep all context on one screen so non-technical reviewers focus on results.

[↗ Focus view](/blog/posts/evals-faq/should-product-managers-and-engineers-collaborate-on-error-analysis-how.html){.faq-individual-link}