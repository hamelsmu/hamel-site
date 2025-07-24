#!/usr/bin/env python3
from pathlib import Path

def add_context_to_file(file_path):
    """Add FAQ context include to the end of a QMD file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check if context include already exists
    if '{{< include _faq-context.qmd >}}' in content:
        print(f"Skipping {file_path.name} - already has context include")
        return False
    
    # Add the context include at the end
    updated_content = content.rstrip() + '\n\n{{< include _faq-context.qmd >}}\n'
    
    # Write back to file
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)
    
    return True

def main():
    # Get all FAQ files except index.qmd and backup and the context file itself
    faq_dir = Path('blog/posts/evals-faq')
    faq_files = list(faq_dir.glob('*.qmd'))
    faq_files = [f for f in faq_files if f.name not in ['index.qmd', 'index.qmd.backup', '_faq-context.qmd']]
    
    print(f"Adding FAQ context to {len(faq_files)} FAQ files...")
    
    updated_files = []
    for file_path in sorted(faq_files):
        if add_context_to_file(file_path):
            updated_files.append(file_path.name)
    
    print(f"\nUpdated {len(updated_files)} files:")
    for filename in updated_files:
        print(f"  ✅ {filename}")
    
    if not updated_files:
        print("No files needed updating.")

if __name__ == "__main__":
    main()
