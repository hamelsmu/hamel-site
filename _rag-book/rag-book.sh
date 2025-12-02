#!/bin/bash

# Sync and render the RAG book to PDF
# Source of truth: notes/llm/rag/

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/../notes/llm/rag"
BOOK_DIR="$SCRIPT_DIR"

echo "=== Syncing RAG book files ==="

# Function to transform a source file into book chapter format
transform_file() {
    local src="$1"
    local dest="$2"
    local chapter_num="$3"

    echo "  Transforming: $(basename "$src") -> $(basename "$dest")"

    # Extract title from YAML frontmatter (--color=never to avoid ANSI codes)
    local title=$(grep --color=never -m1 '^title:' "$src" | sed 's/^title: *["'"'"']*\(.*\)["'"'"']*$/\1/' | sed 's/^"//;s/"$//')

    # Remove the "P1: " prefix from title for chapter heading
    local chapter_title=$(echo "$title" | sed 's/^P[0-9]*: *//')

    # Process the file:
    # 1. Remove YAML frontmatter
    # 2. Add chapter heading
    # 3. Transform image paths to point to source directory
    # 4. Remove CTA div blocks (they have different formatting in book)

    {
        echo "# $chapter_title"
        echo ""
        # Skip YAML frontmatter and process rest of file
        awk '
            BEGIN { in_frontmatter = 0; frontmatter_done = 0 }
            /^---$/ && !frontmatter_done {
                if (in_frontmatter) {
                    frontmatter_done = 1
                    next
                } else {
                    in_frontmatter = 1
                    next
                }
            }
            frontmatter_done { print }
        ' "$src" | \
        # Transform image paths: ![](p1-images/...) -> ![](../notes/llm/rag/p1-images/...)
        sed -E 's|\!\[([^]]*)\]\(p([0-9]+)-images/|\![\1](../notes/llm/rag/p\2-images/|g' | \
        # Remove CTA div blocks (multi-line)
        sed '/<div class="cta"/,/<\/div>/d' | \
        # Remove standalone hr tags
        sed '/^<hr>$/d' | \
        # Remove Quarto callout blocks (:::)
        sed '/^:::{\.callout/,/^:::$/d' | \
        # Remove empty lines at start of content
        sed '/./,$!d'
    } > "$dest"
}

# Transform Part 1
transform_file "$SOURCE_DIR/p1-intro.md" "$BOOK_DIR/01-introduction.qmd" 1

# Transform Part 2
transform_file "$SOURCE_DIR/p2-evals.md" "$BOOK_DIR/02-evaluation.qmd" 2

# Transform Part 3
transform_file "$SOURCE_DIR/p3_reasoning.qmd" "$BOOK_DIR/03-reasoning.qmd" 3

# Transform Part 4
transform_file "$SOURCE_DIR/p4_late_interaction.qmd" "$BOOK_DIR/04-late-interaction.qmd" 4

# Transform Part 5
transform_file "$SOURCE_DIR/p5_map.qmd" "$BOOK_DIR/05-multimodal.qmd" 5

# Transform Part 6
transform_file "$SOURCE_DIR/p6-context_rot.qmd" "$BOOK_DIR/06-context-rot.qmd" 6

# Transform Part 7
transform_file "$SOURCE_DIR/p7-graph-db.qmd" "$BOOK_DIR/07-graph-db.qmd" 7

echo "=== Rendering book to PDF ==="

# Render the RAG book to PDF
cd "$BOOK_DIR"
quarto render --to pdf
sleep 2

# Compress the PDF using Ghostscript (if available)
if command -v gs &> /dev/null; then
    echo "Compressing PDF..."
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
       -dColorImageResolution=500 \
       -dGrayImageResolution=500 \
       -dNOPAUSE -dQUIET -dBATCH \
       -sOutputFile=_book/beyond-naive-rag-compressed.pdf \
       _book/beyond-naive-rag.pdf
    mv _book/beyond-naive-rag-compressed.pdf _book/beyond-naive-rag.pdf
    echo "PDF compressed successfully"
else
    echo "Ghostscript not found, skipping compression"
fi

# Copy the PDF to the source directory
cp _book/beyond-naive-rag.pdf beyond-naive-rag.pdf

# Copy the PDF to the notes/llm/rag directory
cp _book/beyond-naive-rag.pdf "$SOURCE_DIR/beyond-naive-rag.pdf"

echo "=== Done ==="
echo "PDF saved to:"
echo "  - $BOOK_DIR/beyond-naive-rag.pdf"
echo "  - $SOURCE_DIR/beyond-naive-rag.pdf"
