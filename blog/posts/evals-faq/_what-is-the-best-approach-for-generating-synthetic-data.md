## Q: What is the best approach for generating synthetic data?

A common mistake is prompting an LLM to `"give me test queries"` without structure, resulting in generic, repetitive outputs. A structured approach using dimensions produces far better synthetic data for testing LLM applications.

**Start by defining dimensions**: categories that describe different aspects of user queries. Each dimension captures one type of variation in user behavior. For example:

- For a recipe app, dimensions might include Dietary Restriction (*vegan*, *gluten-free*, *none*), Cuisine Type (*Italian*, *Asian*, *comfort food*), and Query Complexity (*simple request*, *multi-step*, *edge case*). 
- For a customer support bot, dimensions could be Issue Type (*billing*, *technical*, *general*), Customer Mood (*frustrated*, *neutral*, *happy*), and Prior Context (*new issue*, *follow-up*, *resolved*).

**Start with failure hypotheses**. If you lack intuition about failure modes, use your application extensively or recruit friends to use it. Then choose dimensions targeting those likely failures.

**Create tuples manually first**: Write 20 tuples by hand—specific combinations selecting one value from each dimension. Example: (*Vegan*, *Italian*, *Multi-step*). This manual work helps you understand your problem space.

**Scale with two-step generation**:

1. **Generate structured tuples**: Have the LLM create more combinations like (*Gluten-free*, *Asian*, *Simple*)
2. **Convert tuples to queries**: In a separate prompt, transform each tuple into natural language

This separation avoids repetitive phrasing. The (*Vegan*, *Italian*, *Multi-step*) tuple becomes: `"I need a dairy-free lasagna recipe that I can prep the day before."`

### Generation approaches

You can generate tuples two ways:

**Cross product then filter**: Generate all dimension combinations, then filter with an LLM. Guarantees coverage including edge cases. Use when most combinations are valid.

**Direct LLM generation**: Ask the LLM to generate tuples directly. More realistic but tends toward generic outputs and misses rare scenarios. Use when many dimension combinations are invalid.

**Fix obvious problems first**: Don't generate synthetic data for issues you can fix immediately. If your prompt doesn't mention dietary restrictions, fix the prompt rather than generating specialized test queries.

After iterating on your tuples and prompts, **run these synthetic queries through your actual system to capture full traces**. Sample 100 traces for error analysis. This number provides enough traces to manually review and identify failure patterns without being overwhelming.

[↗](/blog/posts/evals-faq/what-is-the-best-approach-for-generating-synthetic-data.html){.faq-individual-link}