#!/usr/bin/env python3
"""
Fix individual FAQ frontmatter to avoid interfering with combined post
"""

from pathlib import Path
import re

def fix_individual_faq_frontmatter(file_path):
    """Remove problematic frontmatter from individual FAQ files"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Split content into frontmatter and body
    parts = content.split('---', 2)
    if len(parts) < 3:
        return False
        
    body = parts[2]
    
    # Create minimal frontmatter for individual posts
    # Keep only what's needed for individual post functionality
    minimal_frontmatter = f"""---
categories: [LLMs, evals, faq, faq-individual]
aliases:
  - /evals-faq/{file_path.stem}
page-navigation: true
---"""
    
    # Reconstruct content
    updated_content = minimal_frontmatter + body
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)
    
    return True

def main():
    # Get all individual FAQ files
    faq_dir = Path('../')
    faq_files = list(faq_dir.glob('*.qmd'))
    faq_files = [f for f in faq_files if f.name not in ['index.qmd', 'index.qmd.backup', '_faq-context.qmd']]
    
    print(f"Fixing frontmatter for {len(faq_files)} individual FAQ files...")
    
    updated_files = []
    for file_path in sorted(faq_files):
        if fix_individual_faq_frontmatter(file_path):
            updated_files.append(file_path.name)
    
    print(f"\nUpdated {len(updated_files)} files:")
    for filename in updated_files:
        print(f"  ✅ {filename}")
    
    print(f"\nNext steps:")
    print(f"1. Test that combined FAQ post shows correct title")
    print(f"2. Test that individual FAQ posts are still excluded from listing")
    print(f"3. Test that individual FAQ posts still work when accessed directly")

if __name__ == "__main__":
    main()
