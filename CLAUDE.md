# Claude Code Instructions for hamel-site

## Writing Style

When drafting or editing blog posts for this site, follow these guidelines:

### No Dashes as Punctuation
Never use em dashes (—) or spaced hyphens ( - ) as punctuation. Hamel doesn't use them naturally. Use alternatives:
- Comma for light pauses
- Period to break into two sentences
- Colon to introduce a list or elaboration
- Parentheses for asides

**Bad:** "That's about 3 megabytes of raw text—the equivalent of an old floppy disk."
**Bad:** "You don't need special tools - a knowledge graph can live in a CSV file."
**Good:** "That's about 3 megabytes of raw text, the equivalent of an old floppy disk."
**Good:** "You don't need special tools. A knowledge graph can live in a CSV file."

### Cut Unnecessary Words
Less is more. Remove words that don't add meaning.

**Filler words to cut:**
- "actually", "really", "just", "very", "basically"
- "precisely", "extremely", "significantly", "specifically"
- "perfectly" (as in "perfectly valid")
- "certainly", "definitely", "absolutely"

**Redundant qualifiers:**
- "single silver bullet" → "silver bullet"
- "more basic question" → "basic question"
- "nuanced, complex" → pick one
- "central argument" → "argument"
- "real challenge" → "challenge"
- "full retrieval stack" → "retrieval stack"

**Fluff phrases:**
- "in the X space" → "in X"
- "at places like" → "at"
- "the next generation of" → cut entirely
- "so fundamental that" → cut or simplify
- "know for sure" → "know"
- "objectively compare" → "compare"

**Bad:** "The real challenge here is building a full retrieval stack."
**Good:** "The challenge is building a retrieval stack."

### Keep It Conversational

Aim for ~6th grade reading level. Sentences should be accessible and natural.

**Don't over-simplify to terse:**
When cutting words, don't go so far that it sounds like a slide title or bullet point. Keep the conversational tone.

**Bad (too terse):** "Keeping the graph accurate takes work: tokens for LLM extraction, or labor from domain experts."
**Good (conversational):** "The hard part is keeping everything accurate. That means either spending tokens on LLM calls, or getting domain experts to help."

**Simplify jargon:**
Technical terms, especially in parentheticals, should use plain English.

- "a one-hop expansion from your most relevant nodes" → "finding neighbors of your best results"
- "mutually exclusive (covering distinct topics with minimal overlap)" → "cover distinct topics with little overlap"
- "semantically similar" → "similar"

### Be Direct
Hamel's writing is direct and pragmatic. Avoid:
- Hedging language ("perhaps", "maybe", "it seems like")
- Unnecessary qualifiers
- Passive voice when active is clearer

### Maintain Skeptical, Pragmatic Tone
The blog often challenges hype and advocates for simpler solutions. When writing:
- Question complexity before adding it
- Ground claims in evidence or experience
- Be honest about tradeoffs

### Avoid AI-Style Writing Patterns

See Shreya Shankar's article on [signal degradation](https://www.sh-reya.com/blog/consumption-ai-scale/) for context. AI overuses rhetorical devices indiscriminately, which degrades their effectiveness.

**Avoid hyperbolic phrases:**
- "mind-bending insight" → just state the insight
- "game-changing" → describe what changed
- "much-needed dose of pragmatism" → cliché, delete
- "crucial", "essential", "critical" → often unnecessary intensifiers

**Don't over-bold:**
- Not every bullet point needs a bold header
- If a section has 4+ bold phrases, something is wrong
- Bold should be rare and meaningful, not a formatting default
- Bullet lists with `**Bold Header:** description` on every item is an AI pattern

**Avoid formulaic structure:**
- Don't default to: Intro → H3 sections → bullets → "Key Takeaways" bullets
- Prose paragraphs often read better than bullet lists
- Vary your structure based on what the content needs
- "Here are the key lessons:" followed by bullets is a cliché

**Let insights speak for themselves:**
- Don't announce that something is interesting ("Here's an interesting insight:")
- Don't hype before delivering ("This is where it gets exciting")
- State the thing. If it's interesting, readers will notice.

### Attribution and Synthesis

When adding editorial commentary to content from talks or other sources:
- Use clear callouts like "Hamel's note" to distinguish your voice from the speaker's
- Don't put words in the speaker's mouth
- Synthesis and connecting dots is valuable, but be clear about what's your inference vs. what was said
