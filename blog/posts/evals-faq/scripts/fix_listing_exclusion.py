#!/usr/bin/env python3
"""
Fix the listing exclusion by using proper metadata-based exclusion
"""

from pathlib import Path
import re

def update_individual_faq_categories(file_path):
    """Add faq-individual category to distinguish from combined post"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace the categories line
    old_categories = "categories: [LLMs, evals, faq]"
    new_categories = "categories: [LLMs, evals, faq, faq-individual]"
    
    if old_categories in content:
        updated_content = content.replace(old_categories, new_categories)
        
        # Remove the exclude-from-listing field since we won't need it
        updated_content = re.sub(r'exclude-from-listing: true\n', '', updated_content)
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(updated_content)
        
        return True
    return False

def main():
    # Get all individual FAQ files
    faq_dir = Path('../')
    faq_files = list(faq_dir.glob('*.qmd'))
    faq_files = [f for f in faq_files if f.name not in ['index.qmd', 'index.qmd.backup', '_faq-context.qmd']]
    
    print(f"Updating categories for {len(faq_files)} individual FAQ files...")
    
    updated_files = []
    for file_path in sorted(faq_files):
        if update_individual_faq_categories(file_path):
            updated_files.append(file_path.name)
    
    print(f"\nUpdated {len(updated_files)} files:")
    for filename in updated_files:
        print(f"  ✅ {filename}")
    
    print(f"\nNext steps:")
    print(f"1. Update main index.qmd to exclude 'faq-individual' category")
    print(f"2. Test that combined FAQ post still appears in listing")
    print(f"3. Test that individual FAQ posts are excluded from listing")

if __name__ == "__main__":
    main()
