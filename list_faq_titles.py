#!/usr/bin/env python3
import re
from pathlib import Path
import yaml

def extract_frontmatter(file_path):
    """Extract YAML frontmatter from a file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Split on --- to get frontmatter
    parts = content.split('---', 2)
    if len(parts) < 3:
        return None
    
    try:
        frontmatter = yaml.safe_load(parts[1])
        return frontmatter
    except yaml.YAMLError:
        return None

def main():
    # Get all FAQ files
    faq_dir = Path('blog/posts/evals-faq')
    faq_files = list(faq_dir.glob('*.qmd'))
    faq_files = [f for f in faq_files if f.name not in ['index.qmd', 'index.qmd.backup']]
    
    # Sort by filename for consistent order
    faq_files.sort()
    
    print(f"# FAQ Posts ({len(faq_files)} total)\n")
    
    for i, file_path in enumerate(faq_files, 1):
        frontmatter = extract_frontmatter(file_path)
        if frontmatter:
            title = frontmatter.get('title', 'No title')
            description = frontmatter.get('description', 'No description')
            
            print(f"## {i}. {title}")
            print(f"**Description:** {description}")
            print(f"**File:** `{file_path.name}`")
            print()
        else:
            print(f"## {i}. ERROR: Could not parse {file_path.name}")
            print()

if __name__ == "__main__":
    main()
