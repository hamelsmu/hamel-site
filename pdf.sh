#!/bin/bash

# Render the Quarto document to PDF
pushd blog/posts/evals-faq > /dev/null
quarto render index.qmd --to pdf
sleep 2

# Copy the PDF to the source directory with renamed file
cp ../../../_site/blog/posts/evals-faq/index.pdf evals-faq.pdf

# Move the generated PDF to Dropbox
mv ../../../_site/blog/posts/evals-faq/index.pdf /Users/hamel/Library/CloudStorage/Dropbox/llm_eval_course/evals-faq.pdf

# Return to original directory
popd > /dev/null
