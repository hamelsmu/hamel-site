## Q: How do I debug multi-turn conversation traces?

Start simple. Check if the whole conversation met the user's goal with a pass/fail judgment. Look at the entire trace and focus on the first upstream failure. Read the user-visible parts first to understand if something went wrong. Only then dig into the technical details like tool calls and intermediate steps.

## Multi-agent trace logging

For multi-agent flows, assign a session or trace ID to each user request and log every message with its source (which agent or tool), trace ID, and position in the sequence. This lets you reconstruct the full path from initial query to final result across all agents.

## Annotation strategy

Annotate only the first failure in the trace initially—don't worry about downstream failures since these often cascade from the first issue. Fixing upstream failures often resolves dependent downstream failures automatically. As you gain experience, you can annotate independent failure modes within the same trace to speed up overall error analysis.

## Simplify when possible

When you find a failure, reproduce it with the simplest possible test case. Here's an example: suppose a shopping bot gives the wrong return policy on turn 4 of a conversation. Before diving into the full multi-turn complexity, simplify it to a single turn: "What is the return window for product X1000?" If it still fails, you've proven the error isn't about conversation context - it's likely a basic retrieval or knowledge issue you can debug more easily.

## Test case generation

You have two main approaches. First, simulate users with another LLM to create realistic multi-turn conversations. Second, use "N-1 testing" where you provide the first N-1 turns of a real conversation and test what happens next. The N-1 approach often works better since it uses actual conversation prefixes rather than fully synthetic interactions, but is less flexible.

The key is balancing thoroughness with efficiency. Not every multi-turn failure requires multi-turn analysis. [↗](/blog/posts/evals-faq/how-do-i-debug-multi-turn-conversation-traces.html){.faq-individual-link}