#!/usr/bin/env python3
from pathlib import Path
import re

def add_page_navigation_to_file(file_path):
    """Add page-navigation: true to a QMD file's frontmatter"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Split content by --- to get frontmatter
    parts = content.split('---', 2)
    if len(parts) < 3:
        print(f"Warning: Could not parse frontmatter in {file_path.name}")
        return False
    
    frontmatter = parts[1]
    body = parts[2]
    
    # Check if page-navigation already exists
    if 'page-navigation:' in frontmatter:
        print(f"Skipping {file_path.name} - already has page-navigation")
        return False
    
    # Add page-navigation: true to the end of frontmatter
    updated_frontmatter = frontmatter.rstrip() + '\npage-navigation: true\n'
    
    # Reconstruct the file
    updated_content = f"---{updated_frontmatter}---{body}"
    
    # Write back to file
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)
    
    return True

def main():
    # Get all FAQ files except index.qmd and backup
    faq_dir = Path('../')
    faq_files = list(faq_dir.glob('*.qmd'))
    faq_files = [f for f in faq_files if f.name not in ['index.qmd', 'index.qmd.backup', '_faq-context.qmd']]
    
    print(f"Adding page-navigation to {len(faq_files)} FAQ files...")
    
    updated_files = []
    for file_path in sorted(faq_files):
        if add_page_navigation_to_file(file_path):
            updated_files.append(file_path.name)
    
    print(f"\nUpdated {len(updated_files)} files:")
    for filename in updated_files:
        print(f"  ✅ {filename}")
    
    if not updated_files:
        print("No files needed updating.")

if __name__ == "__main__":
    main()
