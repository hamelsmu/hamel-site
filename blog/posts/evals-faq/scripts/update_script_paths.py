#!/usr/bin/env python3
"""
Update script paths to work from the scripts/ directory
"""

import os
from pathlib import Path

def update_file_paths(file_path):
    """Update paths in a script file to work from scripts directory"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replace hardcoded paths with relative paths from scripts directory
    content = content.replace("Path('blog/posts/evals-faq')", "Path('../')")
    content = content.replace('Path("blog/posts/evals-faq")', 'Path("../")')
    content = content.replace("Path('blog/posts/evals-faq/index.qmd')", "Path('../index.qmd')")
    content = content.replace("Path(f'blog/posts/evals-faq/{filename}')", "Path(f'../{filename}')")
    content = content.replace("Path('blog/posts/evals-faq/index.qmd.backup')", "Path('../index.qmd.backup')")
    
    # Update site_root references for checking links
    content = content.replace('Path(site_root) / "blog/posts/evals-faq"', 'Path(site_root) / "blog/posts/evals-faq"')
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"Updated: {file_path.name}")

def main():
    scripts_dir = Path(__file__).parent
    
    # Update all Python scripts except this one
    for script_file in scripts_dir.glob("*.py"):
        if script_file.name != "update_script_paths.py":
            update_file_paths(script_file)
    
    print("All script paths updated!")

if __name__ == "__main__":
    main()
