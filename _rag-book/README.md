# RAG Book

This directory contains the source files for the RAG book, built with Quarto.

## Rendering the Book

### Prerequisites

Make sure you have [Quarto](https://quarto.org/docs/get-started/) installed.

### Render HTML

To render the book as HTML:

```bash
quarto render
```

This will create the HTML version in the `_book/` directory.

### Render PDF

To render the book as a PDF:

```bash
quarto render --to pdf
```

This will create a PDF file in the current directory.

### Render Both Formats

To render both HTML and PDF:

```bash
quarto render --to all
```

## Preview During Development

To start a live preview server while editing:

```bash
quarto preview
```

This will start a local server and automatically refresh when you make changes to the source files.

## File Structure

- `index.qmd` - Preface/introduction
- `01-introduction.qmd` - Chapter 1: Why RAG isn't dead
- `02-evaluation.qmd` - Chapter 2: Modern evaluation techniques  
- `03-reasoning.qmd` - Chapter 3: Reasoning-enhanced retrieval
- `04-late-interaction.qmd` - Chapter 4: Late interaction models
- `05-multimodal.qmd` - Chapter 5: Multimodal representations
- `conclusion.qmd` - Conclusion
- `_quarto.yml` - Quarto configuration file
- `custom.css` - Custom styling

## Configuration

The book configuration is defined in `_quarto.yml`, including:
- Title and author information
- Chapter order
- Output formats (HTML and PDF)
- Styling and layout options
