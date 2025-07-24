#!/usr/bin/env python3
"""
Add target="_blank" to ALL links in individual FAQ files.
This keeps readers on the FAQ page while allowing them to explore linked content in new tabs.
"""

import os
import re
from pathlib import Path

def is_external_link(url):
    """Check if a URL is external (not a relative or same-domain link)"""
    # Internal links start with / or are relative
    if url.startswith('/'):
        return False
    if url.startswith('./') or url.startswith('../'):
        return False
    if url.startswith('#'):  # Anchor links
        return False
    # If it has a protocol, it's external
    if url.startswith('http://') or url.startswith('https://'):
        return True
    # Domain-relative links without protocol are internal
    return False

def update_all_links_in_file(filepath):
    """Add target='_blank' to ALL links in a file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    
    # Find all markdown links: [text](url) with optional existing attributes
    link_pattern = r'\[([^\]]*)\]\(([^)]+)\)(\{[^}]*\})?'
    
    def replace_link(match):
        text = match.group(1)
        url = match.group(2)
        existing_attrs = match.group(3) or ''
        
        # Skip if target="_blank" already exists
        if 'target=' in existing_attrs:
            return match.group(0)  # Return unchanged
        
        # Add target="_blank" while preserving existing attributes
        if existing_attrs:
            # Remove the closing brace, add target, and close
            attrs_content = existing_attrs[1:-1]  # Remove { and }
            new_attrs = f'{{target="_blank" {attrs_content}}}'
        else:
            new_attrs = '{target="_blank"}'
        
        return f'[{text}]({url}){new_attrs}'
    
    modified_content = re.sub(link_pattern, replace_link, content)
    
    # Write back if content changed
    if modified_content != original_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(modified_content)
        print(f"✅ Updated links in: {filepath}")
        return True
    else:
        print(f"⚪ No links to update in: {filepath}")
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
        if update_all_links_in_file(faq_file):
            modified_count += 1
    
    print(f"\n✅ Modified {modified_count} files")

if __name__ == "__main__":
    main()
