#!/usr/bin/env python3
"""
Fix FAQ files by:
1. Combining separate attribute blocks like {target="_blank"}{.faq-back-link} into {target="_blank" .faq-back-link}
2. Removing 'faq-individual' from categories
"""

import os
import re
from pathlib import Path

def fix_attributes_in_file(filepath):
    """Fix attribute formatting in a file"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    
    # Fix multiple attribute blocks: {attr1}{attr2} -> {attr1 attr2}
    # Pattern to match: }{. or }{target or similar
    attribute_pattern = r'\}(\{[^}]+\})'
    
    def combine_attributes(match):
        # Remove the closing } from first block and opening { from second block
        second_attrs = match.group(1)[1:-1]  # Remove { and }
        return f' {second_attrs}}}'
    
    modified_content = re.sub(attribute_pattern, combine_attributes, content)
    
    # Write back if content changed
    if modified_content != original_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(modified_content)
        print(f"✅ Fixed attributes in: {filepath}")
        return True
    else:
        print(f"⚪ No attribute fixes needed in: {filepath}")
        return False

def remove_faq_individual_tag(filepath):
    """Remove 'faq-individual' from categories in frontmatter"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    
    # Pattern to match categories line and remove faq-individual
    categories_pattern = r'(categories:\s*\[)([^\]]+)(\])'
    
    def fix_categories(match):
        prefix = match.group(1)
        categories_content = match.group(2)
        suffix = match.group(3)
        
        # Split categories, remove faq-individual, and rejoin
        categories = [cat.strip() for cat in categories_content.split(',')]
        categories = [cat for cat in categories if cat != 'faq-individual']
        
        return f"{prefix}{', '.join(categories)}{suffix}"
    
    modified_content = re.sub(categories_pattern, fix_categories, content)
    
    # Write back if content changed
    if modified_content != original_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(modified_content)
        print(f"✅ Removed faq-individual tag from: {filepath}")
        return True
    else:
        print(f"⚪ No faq-individual tag to remove in: {filepath}")
        return False

def main():
    # Get all individual FAQ files (not index.qmd or _* files)
    faq_dir = Path("../")
    individual_faqs = [
        f for f in faq_dir.glob("*.qmd") 
        if f.name != "index.qmd" and not f.name.startswith("_")
    ]
    
    print(f"Found {len(individual_faqs)} individual FAQ files")
    
    print("\n=== Fixing attribute formatting ===")
    attr_modified_count = 0
    for faq_file in individual_faqs:
        if fix_attributes_in_file(faq_file):
            attr_modified_count += 1
    
    print(f"✅ Fixed attributes in {attr_modified_count} files")
    
    print("\n=== Removing faq-individual tags ===")
    tag_modified_count = 0
    for faq_file in individual_faqs:
        if remove_faq_individual_tag(faq_file):
            tag_modified_count += 1
    
    print(f"✅ Removed faq-individual tag from {tag_modified_count} files")

if __name__ == "__main__":
    main()
