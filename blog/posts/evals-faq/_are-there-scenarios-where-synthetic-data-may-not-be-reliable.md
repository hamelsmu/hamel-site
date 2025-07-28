## Q: Are there scenarios where synthetic data may not be reliable?

Yes: synthetic data can mislead or mask issues. For guidance on generating synthetic data when appropriate, see [What is the best approach for generating synthetic data?](#q-what-is-the-best-approach-for-generating-synthetic-data)

Common scenarios where synthetic data fails:

1. **Complex domain-specific content**: LLMs often miss the structure, nuance, or quirks of specialized documents (e.g., legal filings, medical records, technical forms). Without real examples, critical edge cases are missed.

2. **Low-resource languages or dialects**: For low-resource languages or dialects, LLM-generated samples are often unrealistic. Evaluations based on them won't reflect actual performance.

3. **When validation is impossible**: If you can't verify synthetic sample realism (due to domain complexity or lack of ground truth), real data is important for accurate evaluation.

4. **High-stakes domains**: In high-stakes domains (medicine, law, emergency response), synthetic data often lacks subtlety and edge cases. Errors here have serious consequences, and manual validation is difficult.

5. **Underrepresented user groups**: For underrepresented user groups, LLMs may misrepresent context, values, or challenges. Synthetic data can reinforce biases in the training data of the LLM. [↗](/blog/posts/evals-faq/are-there-scenarios-where-synthetic-data-may-not-be-reliable.html){.faq-individual-link}