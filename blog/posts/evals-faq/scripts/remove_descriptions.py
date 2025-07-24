#!/usr/bin/env python3
"""
Remove description field from individual FAQ files.
Individual FAQs don't need descriptions since they're excluded from listings.
"""

import os
import re
from pathlib import Path

def remove_description_from_file(filepath):
    """Remove description field from a single FAQ file."""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Use regex to remove description line from frontmatter
    pattern = r'^description:\s*.*?\n'
    modified_content = re.sub(pattern, '', content, flags=re.MULTILINE)
    
    # Write back if content changed
    if modified_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(modified_content)
        print(f"✅ Removed description from: {filepath}")
        return True
    else:
        print(f"⚪ No description found in: {filepath}")
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
        if remove_description_from_file(faq_file):
            modified_count += 1
    
    print(f"\n✅ Modified {modified_count} files")

if __name__ == "__main__":
    main()
