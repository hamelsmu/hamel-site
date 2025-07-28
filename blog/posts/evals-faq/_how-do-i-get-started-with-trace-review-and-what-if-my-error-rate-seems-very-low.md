## Q: How do I get started with trace review and what if my error rate seems very low?

**Start with notable traces, not random sampling.** User complaints, errors, or unusually long conversations teach you what failure looks like faster than random sampling. Your first 10-20 traces should include obvious failures to calibrate your judgment. Don't worry about statistical representation yet; focus on building intuition.

**Keep tools simple initially.** Export 20 traces to a spreadsheet or use your logging tool's UI (Braintrust, Arize, Langsmith, etc.). Read each trace completely: user input, all model calls, tool use, and final output. Ask: "Did this accomplish what the user wanted?" Write notes about what went wrong. Don't overthink categories initially—just capture observations. After 20 traces, patterns emerge naturally.

**Review chronologically from a recent time window** rather than cherry-picking. This gives you a realistic view of current system performance. Set aside 2-3 hours for your first session—trace review takes time initially but gets faster with practice. By trace 50, you'll have developed shortcuts and heuristics.

### If your error rate seems very low

**Low error rates might mean your system works well—or that you're not looking hard enough.** First, verify you're sampling effectively. If you only review successful-looking traces, you'll miss edge cases. Include traces with unusual patterns: very short or long conversations, multiple tool calls, or sessions where users reformulated questions.

**Challenge your system with stress testing.** Create adversarial queries designed to probe each instruction in your prompt. Test boundary conditions, conflicting requirements, and scenarios your training didn't cover. One team with 2% error rate in random sampling found 40% failures when they systematically tested edge cases.

**Consider raising your quality bar**—evaluate for excellence, not just correctness. [Error analysis](#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed) is about discovering what failure modes exist, not just confirming your system works. Your first review session provides more insight than any amount of planning. [↗](/blog/posts/evals-faq/how-do-i-get-started-with-trace-review-and-what-if-my-error-rate-seems-very-low.html){.faq-individual-link}