#!/usr/bin/env python3
"""
Add back links to individual FAQ posts that go to their specific anchor in the main post.
"""

import os
import re
from pathlib import Path

def title_to_anchor(title):
    """Convert FAQ title to anchor ID (Quarto style)"""
    # Remove "Q: " prefix and convert to anchor format
    clean_title = re.sub(r'^Q:\s*', '', title)
    
    # Convert to lowercase, replace spaces and special chars with hyphens
    anchor = re.sub(r'[^\w\s-]', '', clean_title.lower())
    anchor = re.sub(r'[-\s]+', '-', anchor)
    anchor = anchor.strip('-')
    
    return f"q-{anchor}"

def extract_title_from_frontmatter(content):
    """Extract title from frontmatter"""
    parts = content.split('---', 2)
    if len(parts) < 3:
        return None
    
    frontmatter = parts[1]
    title_match = re.search(r'title:\s*"((?:[^"\\]|\\.)*)"', frontmatter)
    if title_match:
        return title_match.group(1)
    
    return None

def add_back_link_to_file(filepath):
    """Add back link to individual FAQ file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract title
    title = extract_title_from_frontmatter(content)
    if not title:
        print(f"⚠️  No title found in: {filepath}")
        return False
    
    # Generate anchor ID
    anchor_id = title_to_anchor(title)
    back_link_url = f"/blog/posts/evals-faq/#{anchor_id}"
    
    # Check if back link already exists
    if '[↩](' in content:
        print(f"⚪ Back link already exists in: {filepath}")
        return False
    
    # Find the context include and add back link before it
    context_pattern = r'(\{\{< include _faq-context\.qmd >\}\})'
    
    if re.search(context_pattern, content):
        # Add back link before the context include
        replacement = f'[↩ Back to main FAQ]({back_link_url}){{.faq-back-link}}\n\n\\1'
        modified_content = re.sub(context_pattern, replacement, content)
        
        # Write back the modified content
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(modified_content)
        print(f"✅ Added back link to: {filepath} -> {anchor_id}")
        return True
    else:
        print(f"⚠️  No context include found in: {filepath}")
        return False

def main():
    # Get all individual FAQ files (not index.qmd or _* files)
    faq_dir = Path("../")
    individual_faqs = [
        f for f in faq_dir.glob("*.qmd") 
        if f.name != "index.qmd" and not f.name.startswith("_")
    ]
    
    print(f"Found {len(individual_faqs)} individual FAQ files")
    
    modified_count = 0
    for faq_file in individual_faqs:
        if add_back_link_to_file(faq_file):
            modified_count += 1
    
    print(f"\n✅ Modified {modified_count} files")

if __name__ == "__main__":
    main()
