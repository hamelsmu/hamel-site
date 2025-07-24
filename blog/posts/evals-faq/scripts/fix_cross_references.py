#!/usr/bin/env python3
"""
Fix FAQ cross-references:
- Individual FAQ files: convert anchor links to individual post links
- Include files: keep anchor links (for combined FAQ page)
"""

import os
import re
from pathlib import Path

def convert_anchor_to_individual_link(content):
    """Convert anchor links to individual post links"""
    def replace_anchor(match):
        text = match.group(1)
        anchor = match.group(2)
        # Remove q- prefix to get filename
        filename = anchor.replace('q-', '')
        return f'[{text}](/blog/posts/evals-faq/{filename}.html)'
    
    # Convert anchor links like #q-some-faq to individual post links
    content = re.sub(r'\[([^\]]+)\]\(#(q-[^)]+)\)', replace_anchor, content)
    return content

def fix_individual_faq_file(filepath):
    """Fix cross-references in an individual FAQ file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    
    # Convert anchor links to individual post links
    content = convert_anchor_to_individual_link(content)
    
    if content != original_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"✅ Fixed cross-references in: {filepath}")
        return True
    else:
        print(f"⚪ No cross-references to fix in: {filepath}")
        return False

def main():
    # Get all individual FAQ files (not index.qmd or _* files)
    faq_dir = Path("../")
    individual_faqs = [
        f for f in faq_dir.glob("*.qmd") 
        if f.name != "index.qmd" and not f.name.startswith("_")
    ]
    
    print(f"Found {len(individual_faqs)} individual FAQ files")
    print("Fixing cross-references in individual FAQ files...")
    
    modified_count = 0
    for faq_file in individual_faqs:
        if fix_individual_faq_file(faq_file):
            modified_count += 1
    
    print(f"✅ Fixed cross-references in {modified_count} files")

if __name__ == "__main__":
    main()
