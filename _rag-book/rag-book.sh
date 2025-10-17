#!/bin/bash

# Render the RAG book to PDF
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
cp _book/beyond-naive-rag.pdf ../notes/llm/rag/beyond-naive-rag.pdf

# Return to original directory
cd ..
