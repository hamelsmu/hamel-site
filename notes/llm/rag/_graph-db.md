---
title: "You Don't Need a Graph DB (Probably)"
description: "When are graph databases are overkill, and when do they actually make sense?"
author: ["Hamel Husain", "Jo Kristian Bergum"]
image: https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/f2/f20aea96f0937c957729876c1759876653526084985bc2eeb1192b9b8275d927.jpg
order: 1
date: 2025-07-12
---

# You Don't Need a Graph DB (Probably)

Every so often, a specific technology captures the industry's attention (aka hype). Graph databases are having their turn, fueled by a desire to have a universally powerful way to augment LLMs with your data. The logic seems simple: if your data is connected, you need a graph.

But 90% of the time I've seen graph databases used in production, they've been abused, introducing unnecessary complexity where simpler solutions would have worked just fine. Few people talk about this. It takes a bit of boldness to confront the hype.

That's why I was so excited to host a talk with Jo Kristian Bergum, CEO and co-founder of [Hornet Dev](https://hornet.dev/). Jo is a 25-year veteran in the search and retrieval space, with experience at places like Yahoo and Vespa. He's one of the few people I know who publicly shares this healthy skepticism.

In his talk, Jo share nuance on the topic;  

When are graph databases are overkill, and when do they actually make sense?  What are the fundamental principles of retrieval that let you make good decisions about RAG?

![Jo Kristian Bergum's intro slide](https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/78/787ca32ac5f383e3eddf5f83d6d078e8b170b35d381165aed4e1f5b6d6c165d3.jpg)

### The Hunt for a Silver Bullet

The explosion of interest in RAG since late 2022 has been incredible. More engineers than ever are tackling search problems. But this has also led to a frantic search for a "single silver bullet" to solve retrieval.

First, it was the specialized **vector database**. Now, with the popularity of a Microsoft paper on "GraphRAG," the pendulum is swinging toward **graph databases**.

Jo's central argument is that this is a flawed way of thinking. **Retrieval is a nuanced, complex field.** There is no single tool or method that will solve all your problems. The desire to map a new technique (GraphRAG) directly to a specific technology (a graph DB) is a trap that many engineers fall into.

![Meme about being pitched a graph database](https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/2e/2e048004fbd9b0954294ff8786bc1011c95c096561b7b7ba22b3e013113df638.jpg)

### Do You Even Need RAG?

Before we even get to graphs, it's worth asking a more basic question: do you even need a retrieval component?

The "R" in RAG stands for retrieval. The classic information retrieval (IR) model involves a user with an information need, a query, a retrieval system, and a ranked list of documents.

![Diagram of the information retrieval process](https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/77/77b4a1d624442e2a80eebf998b030f9d0450c13a85b1d9d896496c72aa38e32c.jpg)

When LLMs had tiny 8k context windows, retrieval was a necessity. But now, models like Gemini can handle 1 million tokens. That's about 3 megabytes of raw text—the equivalent of an old floppy disk.

![Slide comparing a 1 million token context window to a floppy disk](https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/f2/f20aea96f0937c957729876c1759876653526084985bc2eeb1192b9b8275d927.jpg)

Jo shared a great anecdote about a company struggling with a complex RAG pipeline. When he asked how many documents they had, the answer was 300. For that scale, he advised them to just feed all the documents directly into the LLM's context window. It was simpler, cheaper, and more effective than over-engineering a full retrieval stack.

**The takeaway:** If your document set is small enough and your query volume is low, stuffing the context window is a perfectly valid (and often better) strategy.

### Deconstructing GraphRAG

So what is this "GraphRAG" that's causing all the fuss? The technique, as described in the Microsoft paper, involves a few key steps:

- **Process the Corpus:** Use an LLM to read your entire document collection. This is an expensive, offline process.
- **Build a Knowledge Graph:** Prompt the LLM to extract key **entities** (nodes) and the **relationships** between them (edges).
- **Query the Graph:** At query time, traverse this graph to find relevant information.

The real challenge here is *building and maintaining* the graph. A knowledge graph is a collection of triplets: `(source_entity, relationship, target_entity)`. You can store this in a CSV file, a JSON object, or a standard relational database like Postgres.

![Slide explaining a knowledge graph as triplets](https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/a5/a5cdbc52a32072eff39f146f484d8ff0bf0e16f3599d288cdd1f50f04d5be29a.jpg)

The hard work is ensuring the extracted entities and relationships are accurate, up-to-date, and actually useful. This requires significant investment, whether in token costs for LLM-based extraction or the labor of domain experts.

### The Most Important Step: Evaluation

How do you know if adding a knowledge graph, or any new technique, is actually improving your results? You have to measure it.

This is the step most teams skip. They jump from one hot new method to the next without a stable benchmark. In retrieval, we use metrics like:

- **Mean Reciprocal Rank (MRR):** Measures how high up the list the first relevant document appears.
- **Precision:** Of the documents you returned, how many were relevant?
- **Recall:** Of all possible relevant documents, how many did you find?

To use these metrics, you need an **evaluation dataset**. This involves taking a sample of real user queries and manually labeling which documents are relevant for each query. This "golden dataset" is your ground truth. It allows you to objectively compare different retrieval methods and know for sure if a change is an improvement.

This is why having a solid evaluation process is non-negotiable. It's a topic so fundamental that Shreya Shankar and I built the [AI Evals course](https://maven.com/parlance-labs/evals?promoCode=evals-info-url) to give engineers and PMs the practical skills to build these systems.

**![Slide on the importance of evaluation in retrieval](https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/27/27944b3ed21c6c6b44a7fdf0f50a2113b800929c58509ad093afd7ffe7b1bf9c.jpg)

When to *Actually* Use a Graph Database**

Once you have an evaluation framework you can start asking the right questions. A specialized graph database (like Neo4j) is optimized for one thing: extremely fast traversal of complex graph structures, usually by keeping the graph in memory.

Before you add one to your stack, ask yourself:

- **Do I need *really* fast, low-latency graph traversal?**
- **Is my graph so large that a simpler solution (like Postgres or a file) is too slow?**
- **Does my use case require complex, multi-hop queries (e.g., finding friends of friends of friends)?**

If the answer to these questions isn't a clear "yes," you probably don't need a specialized graph DB. The operational complexity and cost of adding another database to your stack is *very* high. As Jo pointed out, early Facebook ran its massive social graph on MySQL. You can get surprisingly far with general-purpose tools.

![Slide asking the key questions before choosing a graph DB](https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/0e/0e50bbdbcbd6b6e8181163134436fb8c95ea1f9d1f165d5f6871319f17a527ef.jpg)

### The Graph Hidden in Your Vector Search

Here's the most mind-bending insight from Jo's talk: if you're using modern vector search, you're already using graphs.

The most common algorithm for approximate nearest neighbor (ANN) search is **HNSW (Hierarchical Navigable Small World)**. HNSW works by building a graph where the nodes are your vectors and the edges connect vectors that are close to each other in the embedding space. Searching for the nearest neighbors is then a process of traversing this graph.

This insight opens up powerful possibilities. Jo mentioned the **"cluster hypothesis"** in information retrieval: documents that are similar to a relevant document are also likely to be relevant.

You can leverage this with any vector DB using a multi-step query:

- **Initial Retrieval:** Run your standard vector search for a user's query.
- **Re-ranking:** Use an LLM or another method to identify the most relevant results from this initial set.
- **Expansion:** Perform a *second* vector search, this time looking for documents that are similar to the *relevant documents* you just found.

This is a form of graph traversal (a one-hop expansion from your most relevant nodes) that can significantly improve recall. You don't need a specialized graph database to do it.

### Key Takeaways

Jo's talk was a much-needed dose of pragmatism in a hype-filled space. Here are the key lessons:

- **There is no silver bullet.** Stop looking for a single tool or technique to solve retrieval.
- **Evaluate everything.** Before you adopt a new method like GraphRAG, build a "golden dataset" to measure if it actually improves performance.
- **Start simple.** A knowledge graph can be a CSV file. Your database can be Postgres. Early Facebook used MySQL. Don't add a specialized DB unless you can prove you need its specific capabilities.
- **You're already using graphs.** Understand that vector search algorithms like HNSW are graph-based. This allows you to implement sophisticated graph-like retrieval strategies (like cluster-based expansion) without adding new infrastructure.

![No silver bullet slide](https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/73/73506f6d37dac235236c483f21dc10d2cf4d2e10fed9e10c0c96d84f6605412a.jpg)

Jo and his team at Hornet are building the next generation of retrieval for AI agents, based on these first principles. If you're passionate about solving hard retrieval problems and want to work with one of the best minds in the field, you should[ check out their open roles](https://hornet.dev/jobs) and give [Jo a follow on X](https://x.com/jobergum).

![Final CTA slide with link to hornet.dev and twitte](https://devrelifier-public.s3.amazonaws.com/public/screenshots/sha256/50/500b50306a5a258aecb9cd37236b23735c1f11dbf02f25e3b419cea7e30a159d.jpg)