## Q: How should I version and manage prompts?

There is an unavoidable tension between keeping prompts close to the code vs. an environment that non-technical stakeholders can access.

**My preferred approach is storing prompts in Git.** This treats them as software artifacts that are versioned, reviewed, and deployed atomically with the application code. While the Git command line is unfriendly for non-technical folks, the [GitHub](https://github.com) web interface and the GitHub [Desktop app](https://desktop.github.com/) make it very approachable. When I was working at GitHub, I worked with many non-technical professionals, including lawyers and accountants, who used these tools effectively.  Here is a good [blog post](https://ben.balter.com/2023/03/02/github-for-non-technical-roles/) aimed at non-technical folks to get started.

Alternatively, most vendors in the LLM tooling space, such as observability platforms like Arize, Braintrust, and LangSmith, offer dedicated prompt management tools. These are accessible for rapid iteration by product managers but risk creating additional layers of indirection. 

**Why prompt management tools often fall short:** AI products typically involve many moving parts: tools, RAG, agents, etc. Prompt management tools are inherently limiting because they can't easily execute your application's code. Even when they can, there's often significant indirection involved, making it difficult to test prompts with your actual system's capabilities.

**When possible, a REPL or notebook provides a better solution.** If you have Python entry points into your codebase or your codebase is written in Python, Jupyter notebooks are particularly powerful for this purpose. You can experiment with prompts and iterate on your actual AI agents with their full tool and RAG capabilities. This makes it much easier to understand how your system works in practice. Additionally, you can create widgets and small user interfaces within notebooks, giving you the best of both worlds for experimentation and iteration. To see what this looks like in practice, Teresa Torres gives a fantastic, hands-on walkthrough of how she, as a PM, used notebooks for the entire eval and experimentation lifecycle:

{{< video https://youtu.be/N-qAOv_PNPc >}}

[↗ Focus view](/blog/posts/evals-faq/how-should-i-version-and-manage-prompts.html){.faq-individual-link}