#!/usr/bin/env python3
"""
Fix malformed links in include files
"""

import os
import re
from pathlib import Path

def fix_malformed_links(content):
    """Fix malformed links like (filename.qmd){target="_blank"} to anchor links"""
    
    # Pattern to match malformed links: (filename.qmd){target="_blank"}
    def replace_malformed(match):
        text = match.group(1)
        filename = match.group(2)
        # Convert filename to anchor
        anchor = f"q-{filename.replace('.qmd', '')}"
        return f'[{text}](#{anchor})'
    
    # Fix malformed links
    content = re.sub(r'\[([^\]]+)\]\(([^)]+\.qmd)\)\{target="_blank"\}', replace_malformed, content)
    
    return content

def fix_include_file(filepath):
    """Fix malformed links in an include file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    
    # Fix malformed links
    content = fix_malformed_links(content)
    
    if content != original_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"✅ Fixed malformed links in: {filepath}")
        return True
    else:
        print(f"⚪ No malformed links to fix in: {filepath}")
        return False

def main():
    # Get all include files (_*.md files)
    faq_dir = Path("../")
    include_files = [f for f in faq_dir.glob("_*.md") if not f.name.startswith("_faq")]
    
    print(f"Found {len(include_files)} include files")
    print("Fixing malformed links in include files...")
    
    modified_count = 0
    for include_file in include_files:
        if fix_include_file(include_file):
            modified_count += 1
    
    print(f"✅ Fixed malformed links in {modified_count} include files")

if __name__ == "__main__":
    main()
