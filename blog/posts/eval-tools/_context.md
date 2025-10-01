# Overview of Evaluation Vendor Notes

This document contains detailed notes from a panel review of three AI evaluation vendors: Langsmith, Braintrust, and Arize Phoenix. The goal of the review was to assess how each tool performs on a standardized task from our AI evals course.

Each vendor's section is structured as follows:

*   **Overall Sentiment:** A summary of the panel's general impression of the tool.
*   **Positive Feedback / What We Liked:** Specific features, workflows, or design choices that the panel praised.
*   **Critiques and Areas for Improvement:** Specific features, workflows, or design choices that the panel found confusing, inefficient, or lacking.

---

## Langsmith Evaluation Notes

### Overall Sentiment
* The overall workflow is intuitive, especially for those new to formal evaluation processes. The UI guides you through creating datasets, running experiments, and annotating results.

### Positive Feedback / What We Liked

*   **Seamless Workflow from Trace to Playground:** The transition from inspecting a trace to experimenting with it in the playground is very smooth. You can go directly from a trace to the playground without any extra setup, which is a huge plus for rapid iteration.
*   **Prompt Templates and Variables:** Langsmith allows for the creation of prompt templates where you can define variables. This is useful for testing a prompt with different inputs and for creating a more dynamic evaluation setup.
*   **AI-Assisted Prompt Improvement:** The "Prompt Canvas" feature is a powerful tool for prompt engineering. You can use an LLM to help you write a better version of your prompt by providing it with instructions or examples.
*   **Dataset Creation and Management:**
    *   You can easily create datasets by uploading CSV or JSON files.
    *   The schema detection is a nice feature that helps to structure the data correctly, and you can edit it as needed.
    *   There's a feature to add AI-generated examples to a dataset, which can be useful for quickly expanding your test cases, though it should be used with caution to ensure diversity.
*   **Experimentation and Evaluation:**
    *   You can run experiments that apply a prompt to all the examples in a dataset and see the results in a structured way.
    *   The "Annotation Queue" is a dedicated interface for human review and labeling of traces, which is more efficient than using spreadsheets. This feature supports hotkeys and a clean UI for faster annotation.

### Critiques and Areas for Improvement

*   **Limited Side-by-Side Comparison:** The UI doesn't make it easy to see side-by-side comparisons of different prompt versions and their outputs. This makes it harder to track the impact of changes during iteration.
*   **UI/UX Concerns:**
    *   The UI can feel a bit cluttered, with a lot of options and information presented at once. The left bar in the playground, for example, has a lot of elements that might not be immediately relevant.
    *   The distinction between "Feedback" and "Reviewer Notes" in the annotation queue can be confusing.
*   **Potential for Over-Automation:** Features like AI-generated examples, while convenient, can lead to a false sense of security if not used thoughtfully. They might generate homogenous data that doesn't adequately test the system's robustness.
*   **Lack of Guided Workflow:** While the individual features are powerful, the overall workflow could be more guided. For example, after creating a dataset, it's not immediately obvious what the next step should be. A more guided experience would be helpful for users who are new to the platform.

---

## Braintrust Evaluation Notes

### Overall Sentiment
* The panel had a generally positive view of Braintrust, highlighting its clean UI and structured approach to evaluations. The tool's emphasis on human-in-the-loop workflows was a significant strength. However, concerns were raised about the potential for premature automation and the use of a proprietary query language.

### Positive Feedback / What We Liked

*   **Focus on a Structured Evals Process:** The demonstration emphasized a solid, methodical approach to evaluations. The presenter, Wade, started by involving subject-matter experts (his family) to create an initial dataset, a practice the panel strongly endorsed. This grounds the evaluation process in real-world user needs from the very beginning.
*   **Clean and Intuitive User Interface (UI):** The panel generally found the Braintrust UI to be clean and easier to navigate than other tools. One commentator noted that they could often predict where a feature would be located before the presenter clicked on it. The trace viewing screen, in particular, was praised for its readability and clear presentation of information.
*   **Detailed and Useful Trace Viewing:** The trace view provides a comprehensive breakdown of an execution run.
    *   It clearly separates and displays the **System Prompt**, **User Input**, and final **LLM Output**.
    *   It shows **nested operations** as collapsible "spans." For example, the main `get_agent_response` trace contained a nested `Completion` span for the specific LLM call, which had its own detailed metrics like token counts and duration. This level of detail is crucial for debugging complex chains or agentic systems.
*   **Strong Support for Human-in-the-Loop Workflows:** The platform has dedicated UIs designed for human review and annotation, which is critical for creating high-quality datasets and performing error analysis.
    *   **Dataset Curation:** Wade demonstrated a review UI to approve or reject synthetically generated queries before adding them to a dataset.
    *   **Error Analysis (Open Coding):** The same interface was used for "open coding," where a human reviewer can go through traces one-by-one and leave comments. This is the foundational step for building a failure mode taxonomy.
*   **The "Money Table" - The Ideal Output of Error Analysis:** After annotating traces with failure modes, Wade showed a final dataset view that was essentially a spreadsheet with a column for each failure type (e.g., `f_incorrect_followup_questions`, `f_unverified_store_availability`). The panel called this the "money table" because it's the perfect, actionable output for an error analysis process. It allows teams to quickly sort, filter, and quantify the most common failure modes.
*   **Straightforward Code Instrumentation:** Integrating the Braintrust logging into a Python application appeared simple, primarily requiring a `@bt.traced` decorator on the target function. The decorator offers flags (like `no_trace_io=True`) to allow for more granular, manual control over what data gets logged.

### Critiques and Areas for Improvement

*   **The "Loop" AI Scorer - A Potentially Dangerous Abstraction:** The most significant concern was the **"Loop" feature**, an AI agent that was asked to create an evaluation rubric from scratch and then immediately score the application's outputs.
    *   The panel referred to this as **"stacking abstractions."** You are trusting an LLM (Loop) to create a valid test and then immediately trusting its grade on that test, without human validation of the rubric itself.
    *   The resulting **99.1% score** was met with heavy skepticism. The fear is that users, especially those new to evals, might see a high score like this and mistakenly believe their application is nearly perfect, when the test itself could be flawed.
    *   While the AI's reasoning for its rubric was visible, the workflow encourages a level of automation that may be premature and could lead to a false sense of security.
*   **Reliance on a Proprietary Query Language (BTQL):** For creating custom views and filtering data, the tool introduced "BTQL" (Braintrust Query Language). The panel viewed this negatively, stating a strong preference for exporting data to a **Jupyter notebook**. A notebook provides a more powerful, flexible, and familiar environment (Python, Pandas) for the complex data manipulation and visualization required in deep analysis, without the need to learn a new, tool-specific language.
*   **Clunky Data Workflows:** The process for generating and refining synthetic data seemed inefficient. The presenter had to generate data in one experiment, review it, and then seemingly download and re-upload it to create a new, clean dataset for the next step. This should ideally be a more seamless, internal workflow.
*   **Ambiguity in Initial Setup:** When starting in the "Playground," it was unclear if the system prompt was simply pasted in or if it was intelligently imported from an existing application trace. The latter is a much more powerful and useful feature, but the demonstration didn't make it clear which was happening.
*   **Minor UI Issues:**
    *   **Overuse of YAML:** Metadata and other structured data were often displayed as raw YAML blocks within the UI. The panel found this difficult to read and would have preferred a formatted table or interactive object.
    *   **Inefficient Use of Space:** One commentator felt that some screens had too much empty whitespace, making them less information-dense than they could be.

---

## Arize Phoenix Evaluation Notes

### Overall Sentiment

*   The panel had a generally positive view of Phoenix, with one panelist calling it one of his "favorite open source eval tools."
*   The tool is positioned as a developer-first, notebook-centric platform, which resonated well with the panel's data science background.

### Positive Feedback / What We Liked

*   **Notebook-Centric Workflow:**
    *   The entire evaluation process was driven from a Jupyter notebook, which was seen as a major plus. This approach feels less like "magic" and gives the developer more transparency and control.
    *   Panelists appreciated that the workflow felt clean, controllable, and well-integrated with code-based processes that data scientists are already comfortable with.
    *   The ability to export annotated data from the UI back into a Pandas DataFrame in the notebook for further programmatic analysis was highlighted as a powerful feature.
*   **UI & Developer Experience:**
    *   The prompt management UI was praised for being clear and easy to understand. The layout, which separates the core prompt template, model configuration, and tools, was intuitive.
    *   A unique feature the panel liked was the ability to explicitly define the prompt's templating format (e.g., f-string, Mustache), which isn't common in other tools.
    *   The tight integration between traces and the "Playground" (the prompt engineering UI) was noted. A user can jump directly from a specific trace to the Playground to start iterating, which is a smooth workflow.
    *   The process for comparing two different prompt versions side-by-side on the same dataset was straightforward and well-implemented.
*   **Open Source & Local-First Approach:**
    *   Phoenix can be run entirely locally. The demo started by spinning up the UI on `localhost`, which the panel liked because it provides a sense of control and transparency.
    *   As an open-source tool, it was noted for being "hackable," allowing users to potentially interact directly with the underlying database (like SQLite) for custom queries if needed.

### Critiques and Areas for Improvement

*   **Initial Setup Friction:**
    *   A minor critique was that getting started required "a lot of imports" in the notebook, suggesting a small amount of initial setup complexity.
*   **UI Readability:**
    *   The text in the output panes was difficult to read during the demonstration, suggesting that the font size might be too small or that the UI lacks markdown rendering for model outputs. This makes it hard to quickly review and compare long-form text responses.
*   **Metrics and Visualization:**
    *   The tool displays point statistics for each run (e.g., latency, token count, cost), but the panel found this to be of limited use.
    *   **Critique:** There's a strong desire for aggregate visualizations. Instead of a single number for latency, the panel wanted to see a histogram or distribution to identify outliers or bimodal behavior across the entire test dataset.
    *   **Critique:** At the early stage of evaluation shown, the focus should be on qualitative review ("read your data"), and the quantitative metrics like token counts are less important. The UI may over-emphasize them.
*   **Prompt Management and Testing:**
    *   **Critique:** The prompt editor treats the system prompt as one large, monolithic block of text. A panelist expressed a desire for a more component-based approach where individual instructions or "responsibilities" within the prompt could be toggled on and off ("ablated") to systematically test their impact on the model's output.