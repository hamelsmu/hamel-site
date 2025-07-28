#!/usr/bin/env python3
"""
Fix duplicate back links in FAQ files.
Keep only the first back link with target="_blank" .faq-back-link format.
"""

import os
import re
from pathlib import Path

def fix_duplicate_back_links(file_path):
    """Fix duplicate back links in a single file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    
    # Find all back links
    back_link_pattern = r'\[↩ Back to main FAQ\]\([^)]+\)\{[^}]*\.faq-back-link[^}]*\}'
    matches = list(re.finditer(back_link_pattern, content))
    
    if len(matches) <= 1:
        return False  # No duplicates to fix
    
    # Keep only the first match that has target="_blank"
    target_blank_match = None
    for match in matches:
        if 'target="_blank"' in match.group():
            target_blank_match = match
            break
    
    # If no target="_blank" found, keep the first match
    if target_blank_match is None:
        target_blank_match = matches[0]
    
    # Remove all back links
    content = re.sub(back_link_pattern, '', content)
    
    # Add back the single correct back link before the context include
    context_pattern = r'(\{\{< include _faq-context\.qmd >\}\})'
    if re.search(context_pattern, content):
        content = re.sub(context_pattern, target_blank_match.group() + r'\n\n\1', content)
    else:
        # If no context include, add at the end
        content = content.rstrip() + '\n\n' + target_blank_match.group() + '\n'
    
    # Clean up extra whitespace
    content = re.sub(r'\n{3,}', '\n\n', content)
    content = content.strip() + '\n'
    
    if content != original_content:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    
    return False

def main():
    """Fix duplicate back links in all FAQ files"""
    faq_dir = Path(".")
    
    # Find all individual FAQ QMD files
    faq_files = list(faq_dir.glob("*.qmd"))
    faq_files = [f for f in faq_files if f.name not in ['index.qmd', 'index.qmd.backup', '_faq-context.qmd']]
    
    fixed_count = 0
    for faq_file in sorted(faq_files):
        if fix_duplicate_back_links(faq_file):
            print(f"Fixed duplicate back links in: {faq_file.name}")
            fixed_count += 1
    
    print(f"Fixed {fixed_count} files with duplicate back links")

if __name__ == "__main__":
    main()
