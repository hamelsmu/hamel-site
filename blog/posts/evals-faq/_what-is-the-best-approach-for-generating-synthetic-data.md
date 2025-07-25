## Q: What is the best approach for generating synthetic data?

A common mistake is prompting an LLM to `"give me test queries"` without structure, resulting in generic, repetitive outputs. A structured approach using dimensions produces far better synthetic data for testing LLM applications.

**Start by defining dimensions**: categories that describe different aspects of user queries. Each dimension captures one type of variation in user behavior. For example:

- For a recipe app, dimensions might include Dietary Restriction (*vegan*, *gluten-free*, *none*), Cuisine Type (*Italian*, *Asian*, *comfort food*), and Query Complexity (*simple request*, *multi-step*, *edge case*). 
- For a customer support bot, dimensions could be Issue Type (*billing*, *technical*, *general*), Customer Mood (*frustrated*, *neutral*, *happy*), and Prior Context (*new issue*, *follow-up*, *resolved*).

**Choose dimensions that target likely failure modes.** If you suspect your recipe app struggles with scaling ingredients for large groups or your support bot mishandles angry customers, make those dimensions. Use your application first—you need hypotheses about where failures occur. Without this, you'll generate useless test data.

**Once you have dimensions, create tuples:** specific combinations selecting one value from each dimension. A tuple like (*Vegan*, *Italian*, *Multi-step*) represents a particular use case. Write 20 tuples manually to understand your problem space, then use an LLM to scale up.

  The two-step generation process is important. First, have the LLM generate structured tuples. Then, in a separate prompt, convert each tuple to a natural language query. This separation prevents repetitive phrasing. For the vegan Italian tuple above, you might get `"I need a dairy-free lasagna recipe that I can prep the day before."`

**Don't generate synthetic data for problems you can fix immediately.** If your prompt never mentions handling dietary restrictions, fix the prompt rather than generating hundreds of specialized queries. Save synthetic data for complex issues requiring iteration—like an LLM consistently failing at ingredient scaling math or misinterpreting ambiguous requests.

After iterating on your tuples and prompts, **run these synthetic queries through your actual system to capture full traces**. Sample 100 traces for error analysis. This number provides enough traces to manually review and identify failure patterns without being overwhelming. Rather than generating thousands of similar queries, ensure your 100 traces cover diverse combinations across your dimensions—this variety will reveal more failure modes than sheer volume. [↗](/blog/posts/evals-faq/what-is-the-best-approach-for-generating-synthetic-data.html){.faq-individual-link}