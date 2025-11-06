# Frequently Asked Questions (And Answers) About AI Evals
Hamel Husain, Shreya Shankar
2025-07-27

- [Getting Started & Fundamentals](#getting-started--fundamentals)
  - [Q: What are LLM Evals?](#q-what-are-llm-evals)
  - [Q: What’s a minimum viable evaluation
    setup?](#q-whats-a-minimum-viable-evaluation-setup)
  - [Q: How much of my development budget should I allocate to
    evals?](#q-how-much-of-my-development-budget-should-i-allocate-to-evals)
  - [Q: Will these evaluation methods still be relevant in 5-10 years
    given how fast AI is
    changing?](#q-will-these-evaluation-methods-still-be-relevant-in-5-10-years-given-how-fast-ai-is-changing)
- [Error Analysis & Data Collection](#error-analysis--data-collection)
  - [Q: Why is "error analysis" so important in LLM evals, and how is it
    performed?](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed)
  - [Q: How often should I re-run error analysis on my production
    system?](#q-how-often-should-i-re-run-error-analysis-on-my-production-system)
  - [Q: What is the best approach for generating synthetic
    data?](#q-what-is-the-best-approach-for-generating-synthetic-data)
  - [Q: How do I approach evaluation when my system handles diverse user
    queries?](#q-how-do-i-approach-evaluation-when-my-system-handles-diverse-user-queries)
  - [Q: How can I efficiently sample production traces for
    review?](#q-how-can-i-efficiently-sample-production-traces-for-review)
- [Evaluation Design & Methodology](#evaluation-design--methodology)
  - [Q: Why do you recommend binary (pass/fail) evaluations instead of
    1-5 ratings (Likert
    scales)?](#q-why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales)
  - [Q: Should I build automated evaluators for every failure mode I
    find?](#q-should-i-build-automated-evaluators-for-every-failure-mode-i-find)
  - [Q: Should I use "ready-to-use" evaluation
    metrics?](#q-should-i-use-ready-to-use-evaluation-metrics)
  - [Q: Are similarity metrics (BERTScore, ROUGE, etc.) useful for
    evaluating LLM
    outputs?](#q-are-similarity-metrics-bertscore-rouge-etc-useful-for-evaluating-llm-outputs)
  - [Q: Can I use the same model for both the main task and
    evaluation?](#q-can-i-use-the-same-model-for-both-the-main-task-and-evaluation)
- [Human Annotation & Process](#human-annotation--process)
  - [Q: How many people should annotate my LLM
    outputs?](#q-how-many-people-should-annotate-my-llm-outputs)
  - [Q: Should I outsource annotation & labeling to a third
    party?](#q-should-i-outsource-annotation--labeling-to-a-third-party)
  - [Q: What parts of evals can be automated with
    LLMs?](#q-what-parts-of-evals-can-be-automated-with-llms)
  - [Q: Should I stop writing prompts manually in favor of automated
    tools?](#q-should-i-stop-writing-prompts-manually-in-favor-of-automated-tools)
- [Tools & Infrastructure](#tools--infrastructure)
  - [Q: Should I build a custom annotation tool or use something
    off-the-shelf?](#q-should-i-build-a-custom-annotation-tool-or-use-something-off-the-shelf)
  - [Q: What makes a good custom interface for reviewing LLM
    outputs?](#q-what-makes-a-good-custom-interface-for-reviewing-llm-outputs)
  - [Q: What gaps in eval tooling should I be prepared to fill
    myself?](#q-what-gaps-in-eval-tooling-should-i-be-prepared-to-fill-myself)
  - [Q: Seriously Hamel. Stop the bullshit. What’s your favorite eval
    vendor?](#q-seriously-hamel-stop-the-bullshit-whats-your-favorite-eval-vendor)
- [Production & Deployment](#production--deployment)
  - [Q: How are evaluations used differently in CI/CD vs. monitoring
    production?](#q-how-are-evaluations-used-differently-in-cicd-vs-monitoring-production)
  - [Q: What’s the difference between guardrails &
    evaluators?](#q-whats-the-difference-between-guardrails--evaluators)
  - [Q: Can my evaluators also be used to automatically *fix* or
    *correct* outputs in
    production?](#q-can-my-evaluators-also-be-used-to-automatically-fix-or-correct-outputs-in-production)
  - [Q: How much time should I spend on model
    selection?](#q-how-much-time-should-i-spend-on-model-selection)
- [Domain-Specific Applications](#domain-specific-applications)
  - [Q: Is RAG dead?](#q-is-rag-dead)
  - [Q: How should I approach evaluating my RAG
    system?](#q-how-should-i-approach-evaluating-my-rag-system)
  - [Q: How do I choose the right chunk size for my document processing
    tasks?](#q-how-do-i-choose-the-right-chunk-size-for-my-document-processing-tasks)
  - [Q: How do I debug multi-turn conversation
    traces?](#q-how-do-i-debug-multi-turn-conversation-traces)
  - [Q: How do I evaluate agentic
    workflows?](#q-how-do-i-evaluate-agentic-workflows)

This document curates the most common questions Shreya and I received
while <a href="https://bit.ly/evals-ai" target="_blank">teaching</a>
700+ engineers & PMs AI Evals. *Warning: These are sharp opinions about
what works in most cases. They are not universal truths. Use your
judgment.*

<hr>

<div class="cta" style="text-align: center;">

**👉 *If you want to learn more about AI Evals, check out our
<a href="https://bit.ly/evals-ai" target="_blank">AI Evals course</a>***.
Here is a
<a href="https://bit.ly/evals-ai" target="_blank">35% discount code</a>
for readers. 👈

</div>

<hr>

# Getting Started & Fundamentals

## Q: What are LLM Evals?

If you are **completely new** to product-specific LLM evals (not
foundation model benchmarks), see these posts:
<a href="https://hamel.dev/evals" target="_blank">part 1</a>,
<a href="https://hamel.dev/llm-judge/" target="_blank">part 2</a>,
<a href="https://hamel.dev/field-guide" target="_blank">part 3</a>.
Otherwise, keep reading.
<a href="../../../blog/posts/evals-faq/what-are-llm-evals.html"
class="faq-individual-link">↗</a>

## Q: What’s a minimum viable evaluation setup?

Start with <a
href="#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed"
target="_blank">error analysis</a>, not infrastructure. Spend 30 minutes
manually reviewing 20-50 LLM outputs whenever you make significant
changes. Use one
<a href="#q-how-many-people-should-annotate-my-llm-outputs"
target="_blank">domain expert</a> who understands your users as your
quality decision maker (a
“<a href="#q-how-many-people-should-annotate-my-llm-outputs"
target="_blank">benevolent dictator</a>”).

If possible, **use notebooks** to help you review traces and analyze
data. In our opinion, this is the single most effective tool for evals
because you can write arbitrary code, visualize data, and iterate
quickly. You can even build your own <a
href="#q-what-makes-a-good-custom-interface-for-reviewing-llm-outputs"
target="_blank">custom annotation interface</a> right inside notebooks,
as shown in this
<a href="https://youtu.be/aqKUwPKBkB0?si=5KDmMQnRzO_Ce9xH"
target="_blank">video</a>. <a
href="../../../blog/posts/evals-faq/whats-a-minimum-viable-evaluation-setup.html"
class="faq-individual-link">↗</a>

## Q: How much of my development budget should I allocate to evals?

It’s important to recognize that evaluation is part of the development
process rather than a distinct line item, similar to how debugging is
part of software development.

You should always be doing
<a href="https://www.youtube.com/watch?v=qH1dZ8JLLdU"
target="_blank">error analysis</a>. When you discover issues through
error analysis, many will be straightforward bugs you’ll fix
immediately. These fixes don’t require separate evaluation
infrastructure as they’re just part of development.

The decision to build automated evaluators comes down to <a
href="#q-should-i-build-automated-evaluators-for-every-failure-mode-i-find"
target="_blank">cost-benefit analysis</a>. If you can catch an error
with a simple assertion or regex check, the cost is minimal and probably
worth it. But if you need to align an LLM-as-judge evaluator, consider
whether the failure mode warrants that investment.

In the projects we’ve worked on, **we’ve spent 60-80% of our development
time on error analysis and evaluation**. Expect most of your effort to
go toward understanding failures (i.e. looking at data) rather than
building automated checks.

Be <a
href="https://ai-execs.com/2_intro.html#a-case-study-in-misleading-ai-advice"
target="_blank">wary of optimizing for high eval pass rates</a>. If
you’re passing 100% of your evals, you’re likely not challenging your
system enough. A 70% pass rate might indicate a more meaningful
evaluation that’s actually stress-testing your application. Focus on
evals that help you catch real issues, not ones that make your metrics
look good. <a
href="../../../blog/posts/evals-faq/how-much-of-my-development-budget-should-i-allocate-to-evals.html"
class="faq-individual-link">↗</a>

## Q: Will these evaluation methods still be relevant in 5-10 years given how fast AI is changing?

The fundamental principles of evaluation will remain relevant even as
models improve dramatically. There will always be a “gulf between
specification and generalization”—the gap between what we ask for and
what AI delivers. Even with perfect models, you’d still need to verify
they’re solving the right problem. The need for systematic [error
analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed)
, domain-specific testing, and production monitoring only increases as
AI handles more critical tasks.

What changes are the specifics, not the principles. Today’s prompt
engineering tricks might become obsolete, but the need to understand
failure modes remains. Current issues like hallucination might be
solved, but new failure modes will emerge. As systems become more
capable, evaluation becomes more important, not less—the cost of
failures increases when AI makes autonomous decisions in high-stakes
domains.

Think of it like traditional software testing. Unit tests remain
relevant decades after their invention, even though programming
languages and frameworks changed completely. Similarly, systematic
evaluation, error analysis, and domain-specific testing are foundational
practices that transcend specific model architectures. The tools and
techniques evolve, but the discipline of rigorous evaluation becomes
more critical as AI systems become more powerful and widely deployed.

For deeper perspective on this debate, see these two viewpoints: [“The
model is the
product”](https://m.youtube.com/watch?si=qknrtQeITqJ7VsJH&v=4dUFIRj-BWo&feature=youtu.be)
versus [“The model is NOT the
product”](https://www.youtube.com/watch?v=EEw2PpL-_NM). Both
perspectives acknowledge that even as AI capabilities advance, the
fundamental challenge of ensuring systems do what we actually want
remains unchanged. <a
href="../../../blog/posts/evals-faq/will-these-evaluation-methods-still-be-relevant-in-5-10-years-given-how-fast-ai-is-changing.html"
class="faq-individual-link">↗</a>

# Error Analysis & Data Collection

## Q: Why is "error analysis" so important in LLM evals, and how is it performed?

Error analysis is **the most important activity in evals**. Error
analysis helps you decide what evals to write in the first place. It
allows you to identify failure modes unique to your application and
data. The process involves:

### 1. Creating a Dataset

Gathering representative traces of user interactions with the LLM. If
you do not have any data, you can
<a href="#q-what-is-the-best-approach-for-generating-synthetic-data"
target="_blank">generate synthetic data</a> to get started.

### 2. Open Coding

Human annotator(s) (ideally a
<a href="#q-how-many-people-should-annotate-my-llm-outputs"
target="_blank">benevolent dictator</a>) review and write open-ended
notes about traces, noting any issues. This process is akin to
“journaling” and is adapted from qualitative research methodologies.
When beginning, it is recommended to focus on noting the
<a href="#q-how-do-i-debug-multi-turn-conversation-traces"
target="_blank">first failure</a> observed in a trace, as upstream
errors can cause downstream issues, though you can also tag all
independent failures if feasible. A <a
href="https://hamel.dev/blog/posts/llm-judge/#step-1-find-the-principal-domain-expert"
target="_blank">domain expert</a> should be performing this step.

### 3. Axial Coding

Categorize the open-ended notes into a “failure taxonomy.”. In other
words, group similar failures into distinct categories. This is the most
important step. At the end, count the number of failures in each
category. You can use a LLM to help with this step.

### 4. Iterative Refinement

Keep iterating on more traces until you reach
<a href="https://delvetool.com/blog/theoreticalsaturation"
target="_blank">theoretical saturation</a>, meaning new traces do not
seem to reveal new failure modes or information to you. As a rule of
thumb, you should aim to review at least 100 traces.

You should frequently revisit this process. There are advanced ways to
<a href="how-can-i-efficiently-sample-production-traces-for-review.html"
target="_blank">sample data more efficiently</a>, like clustering,
sorting by user feedback, and sorting by high probability failure
patterns. Over time, you’ll develop a “nose” for where to look for
failures in your data.

Do not skip error analysis. It ensures that the evaluation metrics you
develop are supported by real application behaviors instead of
counter-productive generic metrics (which most platforms nudge you to
use). For examples of how error analysis can be helpful, see
<a href="https://www.youtube.com/watch?v=e2i6JbU2R-s"
target="_blank">this video</a>, or this
<a href="https://hamel.dev/blog/posts/field-guide/" target="_blank">blog
post</a>. <a
href="../../../blog/posts/evals-faq/why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.html"
class="faq-individual-link">↗</a>

## Q: How often should I re-run error analysis on my production system?

Re-run comprehensive [error
analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed)
when making significant changes: new features, prompt updates, model
switches, or major bug fixes. During active development, this means
every 2-4 weeks. Each analysis should review 100+ fresh traces to catch
new failure modes.

Between major analyses, review 10-20 traces weekly, focusing on
outliers: unusually long conversations, sessions with multiple retries,
or traces flagged by automated monitoring. Weekly reviews can catch
issues like prompt changes causing hallucinations before they affect
customers.

Adjust frequency based on system stability and usage growth. New systems
need weekly analysis until failure patterns stabilize. Mature systems
might need only monthly analysis unless usage patterns change. Always
analyze after incidents, user complaint spikes, or metric drift. Scaling
usage introduces new edge cases. <a
href="../../../blog/posts/evals-faq/how-often-should-i-re-run-error-analysis-on-my-production-system.html"
class="faq-individual-link">↗</a>

## Q: What is the best approach for generating synthetic data?

A common mistake is prompting an LLM to `"give me test queries"` without
structure, resulting in generic, repetitive outputs. A structured
approach using dimensions produces far better synthetic data for testing
LLM applications.

**Start by defining dimensions**: categories that describe different
aspects of user queries. Each dimension captures one type of variation
in user behavior. For example:

- For a recipe app, dimensions might include Dietary Restriction
  (*vegan*, *gluten-free*, *none*), Cuisine Type (*Italian*, *Asian*,
  *comfort food*), and Query Complexity (*simple request*, *multi-step*,
  *edge case*).
- For a customer support bot, dimensions could be Issue Type (*billing*,
  *technical*, *general*), Customer Mood (*frustrated*, *neutral*,
  *happy*), and Prior Context (*new issue*, *follow-up*, *resolved*).

**Choose dimensions that target likely failure modes.** If you suspect
your recipe app struggles with scaling ingredients for large groups or
your support bot mishandles angry customers, make those dimensions. Use
your application first—you need hypotheses about where failures occur.
Without this, you’ll generate useless test data.

**Once you have dimensions, create tuples:** specific combinations
selecting one value from each dimension. A tuple like (*Vegan*,
*Italian*, *Multi-step*) represents a particular use case. Write 20
tuples manually to understand your problem space, then use an LLM to
scale up.

The two-step generation process is important. First, have the LLM
generate structured tuples. Then, in a separate prompt, convert each
tuple to a natural language query. This separation prevents repetitive
phrasing. For the vegan Italian tuple above, you might get
`"I need a dairy-free lasagna recipe that I can prep the day before."`

**Don’t generate synthetic data for problems you can fix immediately.**
If your prompt never mentions handling dietary restrictions, fix the
prompt rather than generating hundreds of specialized queries. Save
synthetic data for complex issues requiring iteration—like an LLM
consistently failing at ingredient scaling math or misinterpreting
ambiguous requests.

After iterating on your tuples and prompts, **run these synthetic
queries through your actual system to capture full traces**. Sample 100
traces for error analysis. This number provides enough traces to
manually review and identify failure patterns without being
overwhelming. Rather than generating thousands of similar queries,
ensure your 100 traces cover diverse combinations across your
dimensions—this variety will reveal more failure modes than sheer
volume. <a
href="../../../blog/posts/evals-faq/what-is-the-best-approach-for-generating-synthetic-data.html"
class="faq-individual-link">↗</a>

## Q: How do I approach evaluation when my system handles diverse user queries?

> Complex applications often support vastly different query
> patterns—from “What’s the return policy?” to “Compare pricing trends
> across regions for products matching these criteria.” Each query type
> exercises different system capabilities, leading to confusion on how
> to design eval criteria.

***<a href="https://youtu.be/e2i6JbU2R-s?si=8p5XVxbBiioz69Xc"
target="_blank">Error Analysis</a> is all you need.*** Your evaluation
strategy should emerge from observed failure patterns (e.g. error
analysis), not predetermined query classifications. Rather than creating
a massive evaluation matrix covering every query type you can imagine,
let your system’s actual behavior guide where you invest evaluation
effort.

During error analysis, you’ll likely discover that certain query
categories share failure patterns. For instance, all queries requiring
temporal reasoning might struggle regardless of whether they’re simple
lookups or complex aggregations. Similarly, queries that need to combine
information from multiple sources might fail in consistent ways. These
patterns discovered through error analysis should drive your evaluation
priorities. It could be that query category is a fine way to group
failures, but you don’t know that until you’ve analyzed your data.

To see an example of basic error analysis in action,
<a href="https://youtu.be/e2i6JbU2R-s?si=8p5XVxbBiioz69Xc"
target="_blank">see this video</a>. <a
href="../../../blog/posts/evals-faq/how-do-i-approach-evaluation-when-my-system-handles-diverse-user-queries.html"
class="faq-individual-link">↗</a>

## Q: How can I efficiently sample production traces for review?

It can be cumbersome to review traces randomly, especially when most
traces don’t have an error. These sampling strategies help you find
traces more likely to reveal problems:

- **Outlier detection:** Sort by any metric (response length, latency,
  tool calls) and review extremes.
- **User feedback signals:** Prioritize traces with negative feedback,
  support tickets, or escalations.
- **Metric-based sorting:** Generic metrics can serve as exploration
  signals to find interesting traces. Review both high and low scores
  and treat them as exploration clues. Based on what you learn, you can
  build custom evaluators for the failure modes you find.
- **Stratified sampling:** Group traces by key dimensions (user type,
  feature, query category) and sample from each group.

As you get more sophisticated with how you sample, you can incorporate
these tactics into the design of your <a
href="#q-what-makes-a-good-custom-interface-for-reviewing-llm-outputs"
target="_blank">annotation tools</a>. <a
href="../../../blog/posts/evals-faq/how-can-i-efficiently-sample-production-traces-for-review.html"
class="faq-individual-link">↗</a>

# Evaluation Design & Methodology

## Q: Why do you recommend binary (pass/fail) evaluations instead of 1-5 ratings (Likert scales)?

> Engineers often believe that Likert scales (1-5 ratings) provide more
> information than binary evaluations, allowing them to track gradual
> improvements. However, this added complexity often creates more
> problems than it solves in practice.

Binary evaluations force clearer thinking and more consistent labeling.
Likert scales introduce significant challenges: the difference between
adjacent points (like 3 vs 4) is subjective and inconsistent across
annotators, detecting statistical differences requires larger sample
sizes, and annotators often default to middle values to avoid making
hard decisions.

Having binary options forces people to make a decision rather than
hiding uncertainty in middle values. Binary decisions are also faster to
make during error analysis - you don’t waste time debating whether
something is a 3 or 4.

For tracking gradual improvements, consider measuring specific
sub-components with their own binary checks rather than using a scale.
For example, instead of rating factual accuracy 1-5, you could track “4
out of 5 expected facts included” as separate binary checks. This
preserves the ability to measure progress while maintaining clear,
objective criteria.

Start with binary labels to understand what ‘bad’ looks like. Numeric
labels are advanced and usually not necessary. <a
href="../../../blog/posts/evals-faq/why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales.html"
class="faq-individual-link">↗</a>

## Q: Should I build automated evaluators for every failure mode I find?

Focus automated evaluators on failures that persist after fixing your
prompts. Many teams discover their LLM doesn’t meet preferences they
never actually specified - like wanting short responses, specific
formatting, or step-by-step reasoning. Fix these obvious gaps first
before building complex evaluation infrastructure.

Consider the cost hierarchy of different evaluator types. Simple
assertions and reference-based checks (comparing against known correct
answers) are cheap to build and maintain. LLM-as-Judge evaluators
require 100+ labeled examples, ongoing weekly maintenance, and
coordination between developers, PMs, and domain experts. This cost
difference should shape your evaluation strategy.

Only build expensive evaluators for problems you’ll iterate on
repeatedly. Since LLM-as-Judge comes with significant overhead, save it
for persistent generalization failures - not issues you can fix
trivially. Start with cheap code-based checks where possible: regex
patterns, structural validation, or execution tests. Reserve complex
evaluation for subjective qualities that can’t be captured by simple
rules. <a
href="../../../blog/posts/evals-faq/should-i-build-automated-evaluators-for-every-failure-mode-i-find.html"
class="faq-individual-link">↗</a>

## Q: Should I use "ready-to-use" evaluation metrics?

**No. Generic evaluations waste time and create false confidence.**
(Unless you’re using them for exploration).

One instructor noted:

> “All you get from using these prefab evals is you don’t know what they
> actually do and in the best case they waste your time and in the worst
> case they create an illusion of confidence that is unjustified.”[^1]

Generic evaluation metrics are everywhere. Eval libraries contain scores
like helpfulness, coherence, quality, etc. promising easy evaluation.
These metrics measure abstract qualities that may not matter for your
use case. Good scores on them don’t mean your system works.

Instead, conduct <a
href="#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed"
target="_blank">error analysis</a> to understand failures. Define <a
href="#q-why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales"
target="_blank">binary failure modes</a> based on real problems. Create
<a
href="#q-should-i-build-automated-evaluators-for-every-failure-mode-i-find"
target="_blank">custom evaluators</a> for those failures and validate
them against human judgment. Essentially, the entire evals process.

Experienced practitioners may still use these metrics, just not how
you’d expect. As Picasso said: “Learn the rules like a pro, so you can
break them like an artist.” Once you understand why generic metrics fail
as evaluations, you can repurpose them as exploration tools to
<a href="#q-how-can-i-efficiently-sample-production-traces-for-review"
target="_blank">find interesting traces</a> (explained in the next FAQ).
<a
href="../../../blog/posts/evals-faq/should-i-use-ready-to-use-evaluation-metrics.html"
class="faq-individual-link">↗</a>

## Q: Are similarity metrics (BERTScore, ROUGE, etc.) useful for evaluating LLM outputs?

Generic metrics like BERTScore, ROUGE, cosine similarity, etc. are not
useful for evaluating LLM outputs in most AI applications. Instead, we
recommend using <a
href="#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed"
target="_blank">error analysis</a> to identify metrics specific to your
application’s behavior. We recommend designing <a
href="#q-why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales"
target="_blank">binary pass/fail</a>.) evals (using LLM-as-judge) or
code-based assertions.

As an example, consider a real estate CRM assistant. Suggesting showings
that aren’t available (can be tested with an assertion) or confusing
client personas (can be tested with a LLM-as-judge) is problematic .
Generic metrics like similarity or verbosity won’t catch this. A
relevant quote from the course:

> “The abuse of generic metrics is endemic. Many eval vendors promote
> off the shelf metrics, which ensnare engineers into superfluous
> tasks.”

Similarity metrics aren’t always useless. They have utility in domains
like search and recommendation (and therefore can be useful for
<a href="#q-how-should-i-approach-evaluating-my-rag-system"
target="_blank">optimizing and debugging retrieval</a> for RAG). For
example, cosine similarity between embeddings can measure semantic
closeness in retrieval systems, and average pairwise similarity can
assess output diversity (where lower similarity indicates higher
diversity). <a
href="../../../blog/posts/evals-faq/are-similarity-metrics-bertscore-rouge-etc-useful-for-evaluating-llm-outputs.html"
class="faq-individual-link">↗</a>

## Q: Can I use the same model for both the main task and evaluation?

For LLM-as-Judge selection, using the same model is usually fine because
the judge is doing a different task than your main LLM pipeline. The
judges we recommend building do <a
href="#q-why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales"
target="_blank">scoped binary classification tasks</a>. Focus on
achieving high True Positive Rate (TPR) and True Negative Rate (TNR)
with your judge on a held out labeled test set rather than avoiding the
same model family. You can use these metrics on the test set to
understand how well your judge is doing.

When selecting judge models, start with the most capable models
available to establish strong alignment with human judgments. You can
optimize for cost later once you’ve established reliable evaluation
criteria. We do not recommend using the same model for open ended
preferences or response quality (but we don’t recommend building judges
this way in the first place!). <a
href="../../../blog/posts/evals-faq/can-i-use-the-same-model-for-both-the-main-task-and-evaluation.html"
class="faq-individual-link">↗</a>

<hr>

<div class="cta" style="text-align: center;">

**👉 *If you want to learn more about AI Evals, check out our
<a href="https://bit.ly/evals-ai" target="_blank">AI Evals course</a>***.
Here is a
<a href="https://bit.ly/evals-ai" target="_blank">35% discount code</a>
for readers. 👈

</div>

<hr>

# Human Annotation & Process

## Q: How many people should annotate my LLM outputs?

For most small to medium-sized companies, appointing a single domain
expert as a “benevolent dictator” is the most effective approach. This
person—whether it’s a psychologist for a mental health chatbot, a lawyer
for legal document analysis, or a customer service director for support
automation—becomes the definitive voice on quality standards.

A single expert eliminates annotation conflicts and prevents the
paralysis that comes from “too many cooks in the kitchen”. The
benevolent dictator can incorporate input and feedback from others, but
they drive the process. If you feel like you need five subject matter
experts to judge a single interaction, it’s a sign your product scope
might be too broad.

However, larger organizations or those operating across multiple domains
(like a multinational company with different cultural contexts) may need
multiple annotators. When you do use multiple people, you’ll need to
measure their agreement using metrics like Cohen’s Kappa, which accounts
for agreement beyond chance. However, use your judgment. Even in larger
companies, a single expert is often enough.

Start with a benevolent dictator whenever feasible. Only add complexity
when your domain demands it. <a
href="../../../blog/posts/evals-faq/how-many-people-should-annotate-my-llm-outputs.html"
class="faq-individual-link">↗</a>

## Q: Should I outsource annotation & labeling to a third party?

Outsourcing [error
analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed)
is usually a big mistake (with some
[exceptions](#exceptions-for-external-help)). The core of evaluation is
building the product intuition that only comes from systematically
analyzing your system’s failures. You should be extremely skeptical of
this process being delegated.

### **The Dangers of Outsourcing**

When you outsource annotation, you often break the feedback loop between
observing a failure and understanding how to improve the product.
Problems with outsourcing include:

- Superficial Labeling: Even well-defined metrics require nuanced
  judgment that external teams lack. A critical misstep in error
  analysis is excluding domain experts from the labeling process.
  Outsourcing this task to those without domain expertise, like general
  developers or IT staff, often leads to superficial or incorrect
  labeling.  
- Loss of Unspoken Knowledge: A principal domain expert possesses tacit
  knowledge and user understanding that cannot be fully captured in a
  rubric. Involving these experts helps uncover their preferences and
  expectations, which they might not be able to fully articulate
  upfront.  
- Annotation Conflicts and Misalignment: Without a shared context,
  external annotators can create more disagreement than they resolve.
  Achieving alignment is a challenge even for internal teams, which
  means you will spend even more time on this process.

### **The Recommended Approach: Build Internal Capability**

Instead of outsourcing, focus on building an efficient internal
evaluation process.

1\. Appoint a “Benevolent Dictator”. For most teams, the most effective
strategy is to appoint a [single, internal domain
expert](#q-how-many-people-should-annotate-my-llm-outputs) as the final
decision-maker on quality. This individual sets the standard, ensures
consistency, and develops a sense of ownership.

2\. Use a collaborative workflow for multiple annotators. If multiple
annotators are necessary, follow a structured process to ensure
alignment: \* Draft an initial rubric with clear Pass/Fail definitions
and examples. \* Have each annotator label a shared set of traces
independently to surface differences in interpretation. \* Measure
Inter-Annotator Agreement (IAA) using a chance-corrected metric like
Cohen’s Kappa. \* Facilitate alignment sessions to discuss disagreements
and refine the rubric. \* Iterate on this process until agreement is
consistently high.

### **How to Handle Capacity Constraints**

Building internal capacity does not mean you have to label every trace.
Use these strategies to manage the workload:

- Smart Sampling: Review a small, representative sample of traces
  thoroughly. It is more effective to analyze 100 diverse traces to find
  patterns than to superficially label thousands.  
- The “Think-Aloud” Protocol: To make the most of limited expert time,
  use this technique from usability testing. Ask an expert to verbalize
  their thought process while reviewing a handful of traces. This method
  can uncover deep insights in a single one-hour session.  
- Build Lightweight Custom Tools: Build [custom annotation
  tools](#q-what-makes-a-good-custom-interface-for-reviewing-llm-outputs)
  to streamline the review process, increasing throughput.

### **Exceptions for External Help**

While outsourcing the core error analysis process is not recommended,
there are some scenarios where external help is appropriate:

- Purely Mechanical Tasks: For highly objective, unambiguous tasks like
  identifying a phone number or validating an email address, external
  annotators can be used after a rigorous internal process has defined
  the rubric.  
- Tasks Without Product Context: Well-defined tasks that don’t require
  understanding your product’s specific requirements can be outsourced.
  Translation is a good example: it requires linguistic expertise but
  not deep product knowledge.  
- Engaging Subject Matter Experts: Hiring external SMEs to act as your
  internal domain experts is not outsourcing; it is bringing the
  necessary expertise into your evaluation process. For example,
  <a href="https://www.ankihub.net/" target="_blank">AnkiHub</a> hired
  4th-year medical students to evaluate their RAG systems for medical
  content rather than outsourcing to generic annotators. <a
  href="../../../blog/posts/evals-faq/should-i-outsource-annotation-and-labeling-to-a-third-party.html"
  class="faq-individual-link">↗</a>

## Q: What parts of evals can be automated with LLMs?

LLMs can speed up parts of your eval workflow, but they can’t replace
human judgment where your expertise is essential. For example, if you
let an LLM handle all of <a
href="why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.qmd"
target="_blank">error analysis</a> (i.e., reviewing and annotating
traces), you might overlook failure cases that matter for your product.
Suppose users keep mentioning “lag” in feedback, but the LLM lumps these
under generic “performance issues” instead of creating a “latency”
category. You’d miss a recurring complaint about slow response times and
fail to prioritize a fix.

That said, LLMs are valuable tools for accelerating certain parts of the
evaluation workflow *when used with oversight*.

### Here are some areas where LLMs can help:

- **First-pass axial coding:** After you’ve open coded 30–50 traces
  yourself, use an LLM to organize your raw failure notes into proposed
  groupings. This helps you quickly spot patterns, but always review and
  refine the clusters yourself. *Note: If you aren’t familiar with axial
  and open coding, see <a
  href="why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.qmd"
  target="_blank">this faq</a>.*
- **Mapping annotations to failure modes:** Once you’ve defined failure
  categories, you can ask an LLM to suggest which categories apply to
  each new trace (e.g., “Given this annotation: \[open_annotation\] and
  these failure modes: \[list_of_failure_modes\], which apply?”).  
- **Suggesting prompt improvements:** When you notice recurring
  problems, have the LLM propose concrete changes to your prompts.
  Review these suggestions before adopting any changes.  
- **Analyzing annotation data:** Use LLMs or AI-powered notebooks to
  find patterns in your labels, such as “reports of lag increase 3x
  during peak usage hours” or “slow response times are mostly reported
  from users on mobile devices.”

### However, you shouldn’t outsource these activities to an LLM:

- **Initial open coding:** Always read through the raw traces yourself
  at the start. This is how you discover new types of failures,
  understand user pain points, and build intuition about your data.
  Never skip this or delegate it.  
- **Validating failure taxonomies:** LLM-generated groupings need your
  review. For example, an LLM might group both “app crashes after login”
  and “login takes too long” under a single “login issues” category,
  even though one is a stability problem and the other is a performance
  problem. Without your intervention, you’d miss that these issues
  require different fixes.  
- **Ground truth labeling:** For any data used for testing/validating
  LLM-as-Judge evaluators, hand-validate each label. LLMs can make
  mistakes that lead to unreliable benchmarks.  
- **Root cause analysis:** LLMs may point out obvious issues, but only
  human review will catch patterns like errors that occur in specific
  workflows or edge cases—such as bugs that happen only when users paste
  data from Excel.

In conclusion, start by examining data manually to understand what’s
actually going wrong. Use LLMs to scale what you’ve learned, not to
avoid looking at data. <a
href="../../../blog/posts/evals-faq/what-parts-of-evals-can-be-automated-with-llms.html"
class="faq-individual-link">↗</a>

## Q: Should I stop writing prompts manually in favor of automated tools?

Automating prompt engineering can be tempting, but you should be
skeptical of tools that promise to optimize prompts for you, especially
in early stages of development. When you write a prompt, you are forced
to clarify your assumptions and externalize your requirements. Good
writing is good thinking [^2]. If you delegate this task to an automated
tool too early, you risk never fully understanding your own requirements
or the model’s failure modes.

This is because automated prompt optimization typically hill-climb a
predefined evaluation metric. It can refine a prompt to perform better
on known failures, but it cannot discover *new* ones. Discovering new
errors requires <a
href="#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed"
target="_blank">error analysis</a>. Furthermore, research shows that
evaluation criteria tends to shift after reviewing a model’s outputs, a
phenomenon known as “criteria drift” [^3]. This means that evaluation is
an iterative, human-driven sensemaking process, not a static target that
can be set once and handed off to an optimizer.

A pragmatic approach is to use LLMs to improve your prompt based on <a
href="#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed"
target="_blank">open coding</a> (open-ended notes about traces). This
way, you maintain a human in the loop who is looking at the data and
externalizing their requirements. Once you have a high-quality set of
evals, prompt optimization can be effective for that last mile of
performance. <a
href="../../../blog/posts/evals-faq/should-i-stop-writing-prompts-manually-in-favor-of-automated-tools.html"
class="faq-individual-link">↗</a>

# Tools & Infrastructure

## Q: Should I build a custom annotation tool or use something off-the-shelf?

**Build a custom annotation tool.** This is the single most impactful
investment you can make for your AI evaluation workflow. With
AI-assisted development tools like Cursor or Lovable, you can build a
tailored interface in hours. I often find that teams with custom
annotation tools iterate ~10x faster.

Custom tools excel because:

- They show all your context from multiple systems in one place
- They can render your data in a product specific way (images, widgets,
  markdown, buttons, etc.)
- They’re designed for your specific workflow (custom filters, sorting,
  progress bars, etc.)

Off-the-shelf tools may be justified when you need to coordinate dozens
of distributed annotators with enterprise access controls. Even then,
many teams find the configuration overhead and limitations aren’t worth
it.

<a href="https://youtu.be/fA4pe9bE0LY" target="_blank">Isaac’s Anki
flashcard annotation app</a> shows the power of custom tools—handling
400+ results per query with keyboard navigation and domain-specific
evaluation criteria that would be nearly impossible to configure in a
generic tool. <a
href="../../../blog/posts/evals-faq/should-i-build-a-custom-annotation-tool-or-use-something-off-the-shelf.html"
class="faq-individual-link">↗</a>

## Q: What makes a good custom interface for reviewing LLM outputs?

Great interfaces make human review fast, clear, and motivating. We
recommend <a
href="#q-should-i-build-a-custom-annotation-tool-or-use-something-off-the-shelf"
target="_blank">building your own annotation tool</a> customized to your
domain. The following features are possible enhancements we’ve seen work
well, but you don’t need all of them. The screenshots shown are
illustrative examples to clarify concepts. In practice, I rarely
implement all these features in a single app. It’s ultimately a judgment
call based on your specific needs and constraints.

### **1. Render Traces Intelligently, Not Generically**:

Present the trace in a way that’s intuitive for the domain. If you’re
evaluating generated emails, render them to look like emails. If the
output is code, use syntax highlighting. Allow the reviewer to see the
full trace (user input, tool calls, and LLM reasoning), but keep less
important details in collapsed sections that can be expanded. Here is an
example of a custom annotation tool for reviewing real estate assistant
emails:

<img src="images/emailinterface1.png" style="width:75.0%"
target="_blank"
alt="A custom interface for reviewing emails for a real estate assistant." />

### **2. Show Progress and Support Keyboard Navigation**:

Keep reviewers in a state of flow by minimizing friction and motivating
completion. Include progress indicators (e.g., “Trace 45 of 100”) to
keep the review session bounded and encourage completion. Enable hotkeys
for navigating between traces (e.g., N for next), applying labels, and
saving notes quickly. Below is an illustration of these features:

<img src="images/hotkey.png" style="width:75.0%" target="_blank"
alt="An annotation interface with a progress bar and hotkey guide" />

### **3. Trace navigation through clustering, filtering, and search**:

Allow reviewers to filter traces by metadata or search by keywords.
Semantic search helps find conceptually similar problems. Clustering
similar traces (like grouping by user persona) lets reviewers spot
recurring issues and explore hypotheses. Below is an illustration of
these features:

<img src="images/group1.png" style="width:75.0%" target="_blank"
alt="Cluster view showing groups of emails, such as property-focused or client-focused examples. Reviewers can drill into a group to see individual traces." />

### **4. Prioritize labeling traces you think might be problematic**:

Surface traces flagged by guardrails, CI failures, or automated
evaluators for review. Provide buttons to take actions like adding to
datasets, filing bugs, or re-running pipeline tests. Display relevant
context (pipeline version, eval scores, reviewer info) directly in the
interface to minimize context switching. Below is an illustration of
these ideas:

<img src="images/ci.png" style="width:88.0%" target="_blank"
alt="A trace view that allows you to quickly see auto-evaluator verdict, add traces to dataset or open issues. Also shows metadata like pipeline version, reviewer info, and more." />

### General Principle: Keep it minimal

Keep your annotation interface minimal. Only incorporate these ideas if
they provide a benefit that outweighs the additional complexity and
maintenance overhead. <a
href="../../../blog/posts/evals-faq/what-makes-a-good-custom-interface-for-reviewing-llm-outputs.html"
class="faq-individual-link">↗</a>

## Q: What gaps in eval tooling should I be prepared to fill myself?

Most eval tools handle the basics well: logging complete traces,
tracking metrics, prompt playgrounds, and annotation queues. These are
table stakes. Here are four areas where you’ll likely need to supplement
existing tools.

Watch for vendors addressing these gaps: it’s a strong signal they
understand practitioner needs.

### 1. Error Analysis and Pattern Discovery

After reviewing traces where your AI fails, can your tooling
automatically cluster similar issues? For instance, if multiple traces
show the assistant using casual language for luxury clients, you need
something that recognizes this broader “persona-tone mismatch” pattern.
We recommend building capabilities that use AI to suggest groupings,
rewrite your observations into clearer failure taxonomies, help find
similar cases through semantic search, etc.

### 2. AI-Powered Assistance Throughout the Workflow

The most effective workflows use AI to accelerate every stage of
evaluation. During error analysis, you want an LLM helping categorize
your open-ended observations into coherent failure modes. For example,
you might annotate several traces with notes like “wrong tone for
investor,” “too casual for luxury buyer,” etc. Your tooling should
recognize these as the same underlying pattern and suggest a unified
“persona-tone mismatch” category.

You’ll also want AI assistance in proposing fixes. After identifying 20
cases where your assistant omits pet policies from property summaries,
can your workflow analyze these failures and suggest specific prompt
modifications? Can it draft refinements to your SQL generation
instructions when it notices patterns of missing WHERE clauses?

Additionally, good workflows help you conduct data analysis of your
annotations and traces. I like using notebooks with AI in-the-loop like
<a href="https://julius.ai/" target="_blank">Julius</a>,<a href="https://hex.tech" target="_blank">Hex</a>
or <a href="https://solveit.fast.ai/" target="_blank">SolveIt</a>. These
help me discover insights like “location ambiguity errors spike 3x when
users mention neighborhood names” or “tone mismatches occur 80% more
often in email generation than other modalities.”

### 3. Custom Evaluators Over Generic Metrics

Be prepared to build most of your evaluators from scratch. Generic
metrics like “hallucination score” or “helpfulness rating” rarely
capture what actually matters for your application—like proposing
unavailable showing times or omitting budget constraints from emails. In
our experience, successful teams spend most of their effort on
application-specific metrics.

### 4. APIs That Support Custom Annotation Apps

Custom annotation interfaces <a
href="#q-should-i-build-a-custom-annotation-tool-or-use-something-off-the-shelf"
target="_blank">work best for most teams</a>. This requires
observability platforms with thoughtful APIs. I often have to build my
own libraries and abstractions just to make bulk data export manageable.
You shouldn’t have to paginate through thousands of requests or handle
timeout-prone endpoints just to get your data. Look for platforms that
provide true bulk export capabilities and, crucially, APIs that let you
write annotations back efficiently. <a
href="../../../blog/posts/evals-faq/what-gaps-in-eval-tooling-should-i-be-prepared-to-fill-myself.html"
class="faq-individual-link">↗</a>

## Q: Seriously Hamel. Stop the bullshit. What’s your favorite eval vendor?

Eval tools are in an intensely competitive space. It would be futile to
compare their features. If I tried to do such an analysis, it would be
invalidated in a week! Vendors I encounter the most organically in my
work are: <a href="https://www.langchain.com/langsmith"
target="_blank">Langsmith</a>,
<a href="https://arize.com/" target="_blank">Arize</a> and
<a href="https://www.braintrust.dev/" target="_blank">Braintrust</a>.

When I help clients with vendor selection, the decision weighs heavily
towards who can offer the best support, as opposed to purely features.
This changes depending on size of client, use case, etc. Yes - it’s
mainly the human factor that matters, and dare I say, vibes.

I have no favorite vendor. At the core, their features are very
similar - and I often build <a
href="https://hamel.dev/blog/posts/evals/#q-should-i-build-a-custom-annotation-tool-or-use-something-off-the-shelf"
target="_blank">custom tools</a> on top of them to fit my needs.

My suggestion is to explore the vendors and see which one you like the
most. <a
href="../../../blog/posts/evals-faq/seriously-hamel-stop-the-bullshit-whats-your-favorite-eval-vendor.html"
class="faq-individual-link">↗</a>

# Production & Deployment

## Q: How are evaluations used differently in CI/CD vs. monitoring production?

The most important difference between CI vs. production evaluation is
the data used for testing.

Test datasets for CI are small (in many cases 100+ examples) and
purpose-built. Examples cover core features, regression tests for past
bugs, and known edge cases. Since CI tests are run frequently, the cost
of each test has to be carefully considered (that’s why you carefully
curate the dataset). Favor assertions or other deterministic checks over
LLM-as-judge evaluators.

For evaluating production traffic, you can sample live traces and run
evaluators against them asynchronously. Since you usually lack reference
outputs on production data, you might rely more on on more expensive
reference-free evaluators like LLM-as-judge. Additionally, track
confidence intervals for production metrics. If the lower bound crosses
your threshold, investigate further.

These two systems are complementary: when production monitoring reveals
new failure patterns through error analysis and evals, add
representative examples to your CI dataset. This mitigates regressions
on new issues. <a
href="../../../blog/posts/evals-faq/how-are-evaluations-used-differently-in-cicd-vs-monitoring-production.html"
class="faq-individual-link">↗</a>

## Q: What’s the difference between guardrails & evaluators?

Guardrails are **inline safety checks** that sit directly in the
request/response path. They validate inputs or outputs *before* anything
reaches a user, so they typically are:

- **Fast and deterministic** – typically a few milliseconds of latency
  budget.
- **Simple and explainable** – regexes, keyword block-lists, schema or
  type validators, lightweight classifiers.
- **Targeted at clear-cut, high-impact failures** – PII leaks,
  profanity, disallowed instructions, SQL injection, malformed JSON,
  invalid code syntax, etc.

If a guardrail triggers, the system can redact, refuse, or regenerate
the response. Because these checks are user-visible when they fire,
false positives are treated as production bugs; teams version guardrail
rules, log every trigger, and monitor rates to keep them conservative.

On the other hand, evaluators typically run **after** a response is
produced. Evaluators measure qualities that simple rules cannot, such as
factual correctness, completeness, etc. Their verdicts feed dashboards,
regression tests, and model-improvement loops, but they do not block the
original answer.

Evaluators are usually run asynchronously or in batch to afford heavier
computation such as a <a href="https://hamel.dev/blog/posts/llm-judge/"
target="_blank">LLM-as-a-Judge</a>. Inline use of an LLM-as-Judge is
possible *only* when the latency budget and reliability targets allow
it. Slow LLM judges might be feasible in a cascade that runs on the
minority of borderline cases.

Apply guardrails for immediate protection against objective failures
requiring intervention. Use evaluators for monitoring and improving
subjective or nuanced criteria. Together, they create layered
protection.

Word of caution: Do not use llm guardrails off the shelf blindly. Always
<a href="https://hamel.dev/blog/posts/prompt/" target="_blank">look at
the prompt</a>. <a
href="../../../blog/posts/evals-faq/whats-the-difference-between-guardrails-evaluators.html"
class="faq-individual-link">↗</a>

## Q: Can my evaluators also be used to automatically *fix* or *correct* outputs in production?

Yes, but only a specific subset of them. This is the distinction between
an **evaluator** and a **guardrail** that we
<a href="#q-whats-the-difference-between-guardrails-evaluators"
target="_blank">previously discussed</a>. As a reminder:

- **Evaluators** typically run *asynchronously* after a response has
  been generated. They measure quality but don’t interfere with the
  user’s immediate experience.  
- **Guardrails** run *synchronously* in the critical path of the
  request, before the output is shown to the user. Their job is to
  prevent high-impact failures in real-time.

There are two important decision criteria for deciding whether to use an
evaluator as a guardrail:

1.  **Latency & Cost**: Can the evaluator run fast enough and cheaply
    enough in the critical request path without degrading user
    experience?

2.  **Error Rate Trade-offs**: What’s the cost-benefit balance between
    false positives (blocking good outputs and frustrating users) versus
    false negatives (letting bad outputs reach users and causing harm)?
    In high-stakes domains like medical advice, false negatives may be
    more costly than false positives. In creative applications, false
    positives that block legitimate creativity may be more harmful than
    occasional quality issues.

Most guardrails are designed to be **fast** (to avoid harming user
experience) and have a **very low false positive rate** (to avoid
blocking valid responses). For this reason, you would almost never use a
slow or non-deterministic LLM-as-Judge as a synchronous guardrail.
However, these tradeoffs might be different for your use case. <a
href="../../../blog/posts/evals-faq/can-my-evaluators-also-be-used-to-automatically-fix-or-correct-outputs-in-production.html"
class="faq-individual-link">↗</a>

## Q: How much time should I spend on model selection?

Many developers fixate on model selection as the primary way to improve
their LLM applications. Start with error analysis to understand your
failure modes before considering model switching. As Hamel noted in
office hours, “I suggest not thinking of switching model as the main
axes of how to improve your system off the bat without evidence. Does
error analysis suggest that your model is the problem?” <a
href="../../../blog/posts/evals-faq/how-much-time-should-i-spend-on-model-selection.html"
class="faq-individual-link">↗</a>

# Domain-Specific Applications

## Q: Is RAG dead?

Question: Should I avoid using RAG for my AI application after reading
that <a
href="https://pashpashpash.substack.com/p/why-i-no-longer-recommend-rag-for"
target="_blank">“RAG is dead”</a> for coding agents?

> Many developers are confused about when and how to use RAG after
> reading articles claiming “RAG is dead.” Understanding what RAG
> actually means versus the narrow marketing definitions will help you
> make better architectural decisions for your AI applications.

The viral article claiming RAG is dead specifically argues against using
*naive vector database retrieval* for autonomous coding agents, not RAG
as a whole. This is a crucial distinction that many developers miss due
to misleading marketing.

RAG simply means Retrieval-Augmented Generation - using retrieval to
provide relevant context that improves your model’s output. The core
principle remains essential: your LLM needs the right context to
generate accurate answers. The question isn’t whether to use retrieval,
but how to retrieve effectively.

For coding applications, naive vector similarity search often fails
because code relationships are complex and contextual. Instead of
abandoning retrieval entirely, modern coding assistants like Claude Code
<a href="https://x.com/pashmerepat/status/1926717705660375463?s=46"
target="_blank">still uses retrieval</a> —they just employ agentic
search instead of relying solely on vector databases, similar to how
human developers work.

You have multiple retrieval strategies available, ranging from simple
keyword matching to embedding similarity to LLM-powered relevance
filtering. The optimal approach depends on your specific use case, data
characteristics, and performance requirements. Many production systems
combine multiple strategies or use multi-hop retrieval guided by LLM
agents.

Unfortunately, “RAG” has become a buzzword with no shared definition.
Some people use it to mean any retrieval system, others restrict it to
vector databases. Focus on the ultimate goal: getting your LLM the
context it needs to succeed. Whether that’s through vector search,
agentic exploration, or hybrid approaches is a product and engineering
decision.

Rather than following categorical advice to avoid or embrace RAG,
experiment with different retrieval approaches and measure what works
best for your application. For more info on RAG evaluation and
optimization, see [this series of
posts](../../../notes/llm/rag/not_dead.html).
<a href="../../../blog/posts/evals-faq/is-rag-dead.html"
class="faq-individual-link">↗</a>

## Q: How should I approach evaluating my RAG system?

RAG systems have two distinct components that require different
evaluation approaches: retrieval and generation.

The retrieval component is a search problem. Evaluate it using
traditional information retrieval (IR) metrics. Common examples include
Recall@k (of all relevant documents, how many did you retrieve in the
top k?), Precision@k (of the k documents retrieved, how many were
relevant?), or MRR (how high up was the first relevant document?). The
specific metrics you choose depend on your use case. These metrics are
pure search metrics that measure whether you’re finding the right
documents (more on this below).

To evaluate retrieval, create a dataset of queries paired with their
relevant documents. Generate this synthetically by taking documents from
your corpus, extracting key facts, then generating questions those facts
would answer. This reverse process gives you query-document pairs for
measuring retrieval performance without manual annotation.

For the generation component—how well the LLM uses retrieved context,
whether it hallucinates, whether it answers the question—use the same
evaluation procedures covered throughout this course: error analysis to
identify failure modes, collecting human labels, building LLM-as-judge
evaluators, and validating those judges against human annotations.

Jason Liu’s
<a href="https://jxnl.co/writing/2025/05/19/there-are-only-6-rag-evals/"
target="_blank">“There Are Only 6 RAG Evals”</a> provides a framework
that maps well to this separation. His Tier 1 covers traditional IR
metrics for retrieval. Tiers 2 and 3 evaluate relationships between
Question, Context, and Answer—like whether the context is relevant
(C\|Q), whether the answer is faithful to context (A\|C), and whether
the answer addresses the question (A\|Q).

In addition to Jason’s six evals, error analysis on your specific data
may reveal domain-specific failure modes that warrant their own metrics.
For example, a medical RAG system might consistently fail to distinguish
between drug dosages for adults versus children, or a legal RAG might
confuse jurisdictional boundaries. These patterns emerge only through
systematic review of actual failures. Once identified, you can create
targeted evaluators for these specific issues beyond the general
framework.

Finally, when implementing Jason’s Tier 2 and 3 metrics, don’t just use
prompts off the shelf. The standard LLM-as-judge process requires
several steps: error analysis, prompt iteration, creating labeled
examples, and measuring your judge’s accuracy against human labels. Once
you know your judge’s True Positive and True Negative rates, you can
correct its estimates to determine the actual failure rate in your
system. Skip this validation and your judges may not reflect your actual
quality criteria.

In summary, debug retrieval first using IR metrics, then tackle
generation quality using properly validated LLM judges. <a
href="../../../blog/posts/evals-faq/how-should-i-approach-evaluating-my-rag-system.html"
class="faq-individual-link">↗</a>

## Q: How do I choose the right chunk size for my document processing tasks?

Unlike RAG, where chunks are optimized for retrieval, document
processing assumes the model will see every chunk. The goal is to split
text so the model can reason effectively without being overwhelmed. Even
if a document fits within the context window, it might be better to
break it up. Long inputs can degrade performance due to attention
bottlenecks, especially in the middle of the context. Two task types
require different strategies:

### 1. Fixed-Output Tasks → Large Chunks

These are tasks where the output length doesn’t grow with input:
extracting a number, answering a specific question, classifying a
section. For example:

- “What’s the penalty clause in this contract?”
- “What was the CEO’s salary in 2023?”

Use the largest chunk (with caveats) that likely contains the answer.
This reduces the number of queries and avoids context fragmentation.
However, avoid adding irrelevant text. Models are sensitive to
distraction, especially with large inputs. The middle parts of a long
input might be under-attended. Furthermore, if cost and latency are a
bottleneck, you should consider preprocessing or filtering the document
(via keyword search or a lightweight retriever) to isolate relevant
sections before feeding a huge chunk.

### 2. Expansive-Output Tasks → Smaller Chunks

These include summarization, exhaustive extraction, or any task where
output grows with input. For example:

- “Summarize each section”
- “List all customer complaints”

In these cases, smaller chunks help preserve reasoning quality and
output completeness. The standard approach is to process each chunk
independently, then aggregate results (e.g., map-reduce). When sizing
your chunks, try to respect content boundaries like paragraphs,
sections, or chapters. Chunking also helps mitigate output limits. By
breaking the task into pieces, each piece’s output can stay within
limits.

### General Guidance

It’s important to recognize **why chunk size affects results**. A larger
chunk means the model has to reason over more information in one go –
essentially, a heavier cognitive load. LLMs have limited capacity to
**retain and correlate details across a long text**. If too much is
packed in, the model might prioritize certain parts (commonly the
beginning or end) and overlook or “forget” details in the middle. This
can lead to overly coarse summaries or missed facts. In contrast, a
smaller chunk bounds the problem: the model can pay full attention to
that section. You are trading off **global context for local focus**.

No rule of thumb can perfectly determine the best chunk size for your
use case – **you should validate with experiments**. The optimal chunk
size can vary by domain and model. I treat chunk size as a
hyperparameter to tune. <a
href="../../../blog/posts/evals-faq/how-do-i-choose-the-right-chunk-size-for-my-document-processing-tasks.html"
class="faq-individual-link">↗</a>

## Q: How do I debug multi-turn conversation traces?

Start simple. Check if the whole conversation met the user’s goal with a
pass/fail judgment. Look at the entire trace and focus on the first
upstream failure. Read the user-visible parts first to understand if
something went wrong. Only then dig into the technical details like tool
calls and intermediate steps.

When you find a failure, reproduce it with the simplest possible test
case. Here’s an example: suppose a shopping bot gives the wrong return
policy on turn 4 of a conversation. Before diving into the full
multi-turn complexity, simplify it to a single turn: “What is the return
window for product X1000?” If it still fails, you’ve proven the error
isn’t about conversation context - it’s likely a basic retrieval or
knowledge issue you can debug more easily.

For generating test cases, you have two main approaches. First, you can
simulate users with another LLM to create realistic multi-turn
conversations. Second, use “N-1 testing” where you provide the first N-1
turns of a real conversation and test what happens next. The N-1
approach often works better since it uses actual conversation prefixes
rather than fully synthetic interactions (but is less flexible and
doesn’t test the full conversation). User simulation is getting better
as models improve. Keep an eye on this space.

The key is balancing thoroughness with efficiency. Not every multi-turn
failure requires multi-turn analysis. <a
href="../../../blog/posts/evals-faq/how-do-i-debug-multi-turn-conversation-traces.html"
class="faq-individual-link">↗</a>

## Q: How do I evaluate agentic workflows?

We recommend evaluating agentic workflows in two phases:

**1. End-to-end task success.** Treat the agent as a black box and ask
“did we meet the user’s goal?”. Define a precise success rule per task
(exact answer, correct side-effect, etc.) and measure with human or
<a href="https://hamel.dev/blog/posts/llm-judge/"
target="_blank">aligned LLM judges</a>. Take note of the first upstream
failure when conducting <a
href="#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed"
target="_blank">error analysis</a>.

Once error analysis reveals which workflows fail most often, move to
step-level diagnostics to understand why they’re failing.

**2. Step-level diagnostics.** Assuming that you have sufficiently
<a href="https://hamel.dev/blog/posts/evals/#logging-traces"
target="_blank">instrumented your system</a> with details of tool calls
and responses, you can score individual components such as: - *Tool
choice*: was the selected tool appropriate? - *Parameter extraction*:
were inputs complete and well-formed? - *Error handling*: did the agent
recover from empty results or API failures? - *Context retention*: did
it preserve earlier constraints? - *Efficiency*: how many steps,
seconds, and tokens were spent? - *Goal checkpoints*: for long workflows
verify key milestones.

Example: “Find Berkeley homes under \$1M and schedule viewings” breaks
into: parameters extracted correctly, relevant listings retrieved,
availability checked, and calendar invites sent. Each checkpoint can
pass or fail independently, making debugging tractable.

**Use transition failure matrices to understand error patterns.** Create
a matrix where rows represent the last successful state and columns
represent where the first failure occurred. This is a great way to
understand where the most failures occur.

<img src="images/shreya_matrix.png" style="width:75.0%" target="_blank"
alt="Transition failure matrix showing hotspots in text-to-SQL agent workflow" />

Transition matrices transform overwhelming agent complexity into
actionable insights. Instead of drowning in individual trace reviews,
you can immediately see that GenSQL → ExecSQL transitions cause 12
failures while DecideTool → PlanCal causes only 2. This data-driven
approach guides where to invest debugging effort. Here is another <a
href="https://www.figma.com/deck/nwRlh5renu4s4olaCsf9lG/Failure-is-a-Funnel?node-id=2009-927&amp;t=GJlTtxQ8bLJaQ92A-1"
target="_blank">example</a> from Bryan Bischof, that is also a
text-to-SQL agent:

<img src="images/bischof_matrix.png" style="width:75.0%" target="_blank"
alt="Bischof, Bryan “Failure is A Funnel - Data Council, 2025”" />

In this example, Bryan shows variation in transition matrices across
experiments. How you organize your transition matrix depends on the
specifics of your application. For example, Bryan’s text-to-SQL agent
has an inherent sequential workflow which he exploits for further
analytical insight. You can watch his
<a href="https://youtu.be/R_HnI9oTv3c?si=hRRhDiydHU5k6ikc"
target="_blank">full talk</a> for more details.

**Creating Test Cases for Agent Failures**

Creating test cases for agent failures follows the same principles as
our previous FAQ on
<a href="#q-how-do-i-debug-multi-turn-conversation-traces"
target="_blank">debugging multi-turn conversation traces</a> (i.e. try
to reproduce the error in the simplest way possible, only use multi-turn
tests when the failure actually requires conversation context, etc.). <a
href="../../../blog/posts/evals-faq/how-do-i-evaluate-agentic-workflows.html"
class="faq-individual-link">↗</a>

<hr>

<div class="cta" style="text-align: center;">

**👉 *If you want to learn more about AI Evals, check out our
<a href="https://bit.ly/evals-ai" target="_blank">AI Evals course</a>***.
Here is a
<a href="https://bit.ly/evals-ai" target="_blank">35% discount code</a>
for readers. 👈

</div>

<hr>

[^1]: <a href="https://www.linkedin.com/in/intellectronica/"
    target="_blank">Eleanor Berger</a>, our wonderful TA.

[^2]: Paul Graham,
    <a href="https://paulgraham.com/writes.html" target="_blank">“Writes and
    Write-Nots”</a>

[^3]: Shreya Shankar, et al.,
    <a href="https://arxiv.org/abs/2404.12272" target="_blank">“Who
    Validates the Validators? Aligning LLM-Assisted Evaluation of LLM
    Outputs with Human Preferences”</a>
