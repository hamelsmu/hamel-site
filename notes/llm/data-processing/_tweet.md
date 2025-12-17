New video from @sh_reya on data processing with LLMs at scale, an underrated topic:

Shreya starts with a real use case: public defenders analyzing case files for racial bias (4:08). Hundreds of pages per defendant. Court transcripts, police reports, news articles. This is something you need LLMs for. Running GPT-5 on everything costs a fortune.

Her solution: treat LLMs like database operators. Semantic Map, Filter, Reduce (9:18). Databricks, BigQuery, and Snowflake are already shipping this as "AI SQL."

The interesting part starts at 12:51: a query optimizer for LLMs.

Traditional databases rewrite queries for efficiency. Shreya does the same for LLM pipelines. Split long documents into chunks, process each, merge results. Decompose complex prompts into simpler ones. Replace trivial LLM calls with Python functions.

These "rewrite directives" improve both cost AND accuracy.

She also talks about a cost optimization technique: Task Cascades (30:00).

Instead of running GPT-5 on every document, first ask cheap questions. "Is there any lower court mentioned?" If no, the document clearly doesn't overturn a lower court.  There are many other routing questions you can ask to reduce the amount of text sent to the LLM.  This requires careful optimization and tuning to get right.  She explains how to do this in the video.

Result: 86% cost reduction, 90% accuracy retained.

---

At 41:26, Shreya shifts to HCI. She built DocWrangler, an IDE for LLM pipelines. The design is based on "Three Gulfs" (44:35):

1. Comprehension: You don't know what's in your data
2. Specification: "Only prescription meds" is hard to operationalize
3. Generalization: A prompt that works on 10 examples fails at 10,000

Users invented "throwaway pipelines" just to explore their data before doing real analysis. Pipelines with no analytical purpose: "summarize these documents," "extract key ideas." Just ways to learn what's in their data before doing the real work. DocWrangler makes this a first-class feature.

---

My favorite message from the video: you don't know what "good" means until you see examples.

In one study, a medical analyst extracted medications from doctor-patient transcripts. As they inspected outputs, they noticed every medication appeared with a dosage. They hadn't anticipated this. Now they wanted dosages too. They also saw Tylenol and ibuprofen appearing and realized: "Actually, I only want prescription medications."

Shreya calls this "criteria drift." Your evaluation criteria evolve as you see more outputs. This matters because standard ML assumes fixed metrics: define them upfront, collect labels, measure. But with LLMs on fuzzy tasks, that assumption breaks. You discover what you actually want through the process of evaluating.

If you don't account for criteria drift, you end up optimizing for a rubric you no longer believe in. DocWrangler and EvalGen accommodate this by placing the human in the loop thoughtfully.

---

Chapter timestamps:
(4:08) - The problem: unstructured data at scale
(9:18) - Semantic operators (Map, Filter, Reduce)
(12:51) - Query optimization for LLMs
(18:15) - Data decomposition (chunking)
(30:00) - Task Cascades (86% cost reduction)
(41:26) - DocWrangler IDE
(44:35) - Three Gulfs framework
(51:50) - Evaluation criteria drift

Full write-up with annotated slides: [LINK]

Video: https://youtu.be/t6r4U0SlnPc
