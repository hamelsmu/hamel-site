#!/usr/bin/env python3
import re
import os
from pathlib import Path

def slugify(text):
    """Convert text to URL-friendly slug"""
    # Remove "Q: " prefix and clean up
    text = re.sub(r'^Q:\s*', '', text)
    # Convert to lowercase and replace spaces/special chars with hyphens
    slug = re.sub(r'[^\w\s-]', '', text.lower())
    slug = re.sub(r'[-\s]+', '-', slug)
    return slug.strip('-')

def extract_description(content):
    """Extract a description from the FAQ content"""
    # Remove any markdown headers and formatting
    clean_content = re.sub(r'^#+\s*', '', content, flags=re.MULTILINE)
    clean_content = re.sub(r'\*\*(.*?)\*\*', r'\1', clean_content)
    clean_content = re.sub(r'\*(.*?)\*', r'\1', clean_content)
    
    # Find the first substantial paragraph (not just a question restatement)
    paragraphs = [p.strip() for p in clean_content.split('\n\n') if p.strip()]
    
    for paragraph in paragraphs:
        # Skip short paragraphs, questions, or structural elements
        if (len(paragraph) > 100 and 
            not paragraph.startswith('Question:') and
            not paragraph.startswith('> ') and
            '{{' not in paragraph and
            not paragraph.startswith('**')):
            # Take first sentence or two, limit to ~150 chars
            sentences = paragraph.split('. ')
            desc = sentences[0]
            if len(desc) < 80 and len(sentences) > 1:
                desc += '. ' + sentences[1]
            if len(desc) > 150:
                desc = desc[:147] + '...'
            return desc
    
    # Fallback: use first paragraph, truncated
    if paragraphs:
        desc = paragraphs[0]
        if len(desc) > 150:
            desc = desc[:147] + '...'
        return desc
    
    return "FAQ about AI evaluations and best practices."

def main():
    # Read the original FAQ file
    faq_file = Path('../index.qmd')
    
    with open(faq_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Split content into sections
    # First, extract the frontmatter and introduction
    parts = content.split('---', 2)
    if len(parts) < 3:
        print("Error: Could not parse frontmatter")
        return
    
    frontmatter = parts[1].strip()
    body = parts[2]
    
    # Find all Q&A sections
    sections = re.split(r'\n## Q:', body)
    
    # The first section is the introduction
    intro = sections[0].strip()
    
    # Process each Q&A section
    individual_files = []
    include_statements = []
    
    for i, section in enumerate(sections[1:], 1):
        # Extract question title and content
        lines = section.strip().split('\n', 1)
        question = lines[0].strip()
        content_part = lines[1] if len(lines) > 1 else ""
        
        # Create slug
        slug = slugify(question)
        filename = f"{slug}.qmd"
        individual_files.append(filename)
        
        # Extract description
        description = extract_description(content_part)
        
        # Escape quotes in YAML strings
        safe_question = question.replace('"', '\\"')
        safe_description = description.replace('"', '\\"')
        
        # Create frontmatter for individual file
        individual_frontmatter = f"""---
title: "Q: {safe_question}"
description: "{safe_description}"
categories: [LLMs, evals, faq]
author: 
  - Hamel Husain
  - Shreya Shankar
date: last-modified
image: images/eval_faq.png
exclude-from-listing: true
aliases:
  - /evals-faq/{slug}
---"""
        
        # Create individual file content
        # Remove the question from content since it's now in the title
        individual_content = f"{individual_frontmatter}\n\n{content_part.strip()}"
        
        # Write individual file
        output_path = Path(f'../{filename}')
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(individual_content)
        
        include_statements.append(f"{{{{< include {filename} >}}}}")
        
        print(f"Created: {filename}")
    
    # Create the new combined file content
    # Find where the Q&As start and end
    intro_end = body.find('\n## Q:')
    if intro_end == -1:
        intro_content = intro
        outro_content = ""
    else:
        intro_content = body[:intro_end].strip()
        
        # Find any content after the last Q&A (like footnotes)
        outro_match = re.search(r'\n\[?\^[0-9]+\]?:', body)
        if outro_match:
            outro_start = outro_match.start()
            outro_content = body[outro_start:].strip()
        else:
            outro_content = ""
    
    # Create new combined file
    new_combined_content = f"""---
{frontmatter}
---

{intro_content}

{chr(10).join(include_statements)}

{outro_content}"""
    
    # Backup original file
    backup_path = Path('../index.qmd.backup')
    os.rename(faq_file, backup_path)
    print(f"Backed up original to: {backup_path}")
    
    # Write new combined file
    with open(faq_file, 'w', encoding='utf-8') as f:
        f.write(new_combined_content)
    
    print(f"Updated combined file: {faq_file}")
    print(f"Created {len(individual_files)} individual FAQ files")
    print(f"Include statements added to combined file")

if __name__ == "__main__":
    main()
