#!/usr/bin/env python3
"""
Fix include files to use anchor links instead of individual post links
"""

import os
import re
from pathlib import Path

def convert_individual_links_to_anchors(content):
    """Convert individual post links to anchor links for combined FAQ page"""
    def replace_link(match):
        text = match.group(1)
        filename = match.group(2)
        # Convert filename to anchor format
        anchor = f"q-{filename}"
        return f'[{text}](#{anchor})'
    
    # Convert individual post links to anchor links
    content = re.sub(r'\[([^\]]+)\]\(/blog/posts/evals-faq/([^)]+)\.html\)', replace_link, content)
    return content

def fix_include_file(filepath):
    """Fix cross-references in an include file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    
    # Convert individual post links to anchor links
    content = convert_individual_links_to_anchors(content)
    
    if content != original_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"✅ Fixed include links in: {filepath}")
        return True
    else:
        print(f"⚪ No include links to fix in: {filepath}")
        return False

def main():
    # Get all include files (_*.md files)
    faq_dir = Path("../")
    include_files = list(faq_dir.glob("_*.md"))
    
    print(f"Found {len(include_files)} include files")
    print("Fixing cross-references in include files...")
    
    modified_count = 0
    for include_file in include_files:
        if fix_include_file(include_file):
            modified_count += 1
    
    print(f"✅ Fixed cross-references in {modified_count} include files")

if __name__ == "__main__":
    main()
