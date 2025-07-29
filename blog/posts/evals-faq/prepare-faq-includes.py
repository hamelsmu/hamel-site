#!/usr/bin/env python3
"""
Pre-render script to prepare clean FAQ includes without frontmatter.

This script:
1. Reads each individual FAQ QMD file
2. Extracts the title from frontmatter
3. Strips all frontmatter
4. Adds the title as an H2 heading
5. Saves as _filename.md (ignored during rendering)
6. Updates the combined index.qmd to include the clean markdown files
"""

import os
import re
from pathlib import Path
if not os.getenv("QUARTO_PROJECT_RENDER_ALL"): exit()

def extract_title_and_content(qmd_file):
    """Extract title from frontmatter and return clean content"""
    with open(qmd_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Split frontmatter and content
    parts = content.split('---', 2)
    if len(parts) < 3:
        return None, content
    
    frontmatter = parts[1]
    body = parts[2].strip()
    
    # Extract title from frontmatter (handle escaped quotes)
    title_match = re.search(r'title:\s*"((?:[^"\\]|\\.)*)"', frontmatter)
    if title_match:
        title = title_match.group(1)
        # Remove the "Q: " prefix if present
        title = re.sub(r'^Q:\s*', '', title)
        return title, body
    
    return None, body

def convert_faq_links_for_context(content, is_for_include=True):
    """Convert FAQ cross-references based on context"""
    if is_for_include:
        # For include files (combined FAQ): anchor links should stay as anchors
        # Convert individual post links to anchors
        content = re.sub(
            r'\[([^\]]+)\]\(/blog/posts/evals-faq/([^)]+)\.html\)',
            lambda m: f'[{m.group(1)}](#{filename_to_anchor(m.group(2))})',
            content
        )
    else:
        # For individual files: convert anchor links to individual post links
        content = re.sub(
            r'\[([^\]]+)\]\(#(q-[^)]+)\)',
            lambda m: f'[{m.group(1)}](/blog/posts/evals-faq/{anchor_to_filename(m.group(2))}.html)',
            content
        )
    
    return content

def filename_to_anchor(filename):
    """Convert filename to anchor ID"""
    # Remove any existing q- prefix and add it back
    clean_name = filename.replace('q-', '')
    return f"q-{clean_name}"

def anchor_to_filename(anchor):
    """Convert anchor ID to filename"""
    # Remove q- prefix to get the filename
    return anchor.replace('q-', '')

def create_clean_include(qmd_file, output_dir):
    """Create a clean markdown file for inclusion"""
    title, content = extract_title_and_content(qmd_file)
    
    if not title:
        print(f"Warning: No title found in {qmd_file.name}")
        return None
    
    # Remove the context include from content (should only appear in individual pages)
    content = re.sub(r'\{\{< include _faq-context\.qmd >\}\}\s*', '', content).strip()
    
    # Remove back links from content (should only appear in individual pages)
    content = re.sub(r'\[↩ Back to main FAQ\]\([^)]+\)\{[^}]*\.faq-back-link[^}]*\}\s*', '', content).strip()
    
    # Convert FAQ cross-references for include context (keep anchor links)
    content = convert_faq_links_for_context(content, is_for_include=True)
    
    # Create URL for individual FAQ post
    individual_url = f"/blog/posts/evals-faq/{qmd_file.stem}.html"
    
    # Create clean content with H2 heading and individual post link at the end
    # Place link at the end of content, handling footnotes and video divs if they exist
    if re.search(r'\[\^\d+\]:', content):
        # If footnotes exist, place link before them
        footnote_pattern = r'(\n\n\[\^\d+\]:.*?)$'
        if re.search(footnote_pattern, content, re.DOTALL):
            content_with_link = re.sub(footnote_pattern, r'\n\n[↗]({}){{.faq-individual-link}}\1'.format(individual_url), content, flags=re.DOTALL)
        else:
            content_with_link = f"{content}\n\n[↗]({individual_url}){{.faq-individual-link}}"
    elif content.rstrip().endswith(':::'):
        # If content ends with a closing div, add link after it
        content_with_link = f"{content}\n\n[↗]({individual_url}){{.faq-individual-link}}"
    else:
        # No footnotes or special endings, just add at the end
        content_with_link = f"{content}\n\n[↗]({individual_url}){{.faq-individual-link}}"
    
    clean_content = f"## Q: {title}\n\n{content_with_link}"
    
    # Create output filename with _ prefix
    output_file = output_dir / f"_{qmd_file.stem}.md"
    
    # Write clean markdown file
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(clean_content)
    
    return output_file

def update_combined_post(faq_dir, include_files):
    """Update the combined FAQ post to use clean includes"""
    index_file = faq_dir / "index.qmd"
    
    # Read current index file
    with open(index_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Find all current include statements
    current_includes = re.findall(r'\{\{< include ([^>]+) >\}\}', content)
    
    # Create mapping from old includes to new includes
    include_mapping = {}
    for include_file in include_files:
        # Find the corresponding old include
        base_name = include_file.stem[1:]  # Remove _ prefix
        old_include = f"{base_name}.qmd"
        if old_include in [inc.strip() for inc in current_includes]:
            include_mapping[old_include] = include_file.name
    
    # Replace includes in content
    updated_content = content
    for old_include, new_include in include_mapping.items():
        old_pattern = f"{{{{< include {old_include} >}}}}"
        new_pattern = f"{{{{< include {new_include} >}}}}"
        updated_content = updated_content.replace(old_pattern, new_pattern)
    
    # Write updated index file
    with open(index_file, 'w', encoding='utf-8') as f:
        f.write(updated_content)
    
    print(f"Updated {len(include_mapping)} includes in index.qmd")

def fix_individual_faq_links(faq_files):
    """Fix cross-references in individual FAQ files to point to other individual posts"""
    print("Fixing individual FAQ cross-references...")
    
    for qmd_file in faq_files:
        with open(qmd_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        
        # Convert anchor links to individual post links
        content = convert_faq_links_for_context(content, is_for_include=False)
        
        if content != original_content:
            with open(qmd_file, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"Fixed links in: {qmd_file.name}")

def main():
    """Main pre-render script"""
    # Get the FAQ directory
    faq_dir = Path("blog/posts/evals-faq")
    
    if not faq_dir.exists():
        print("FAQ directory not found - script may be running from wrong location")
        return
    
    # Find all individual FAQ QMD files
    faq_files = list(faq_dir.glob("*.qmd"))
    faq_files = [f for f in faq_files if f.name not in ['index.qmd', 'index.qmd.backup', '_faq-context.qmd']]
    
    print(f"Processing {len(faq_files)} individual FAQ files...")
    
    # First, fix cross-references in individual FAQ files
    fix_individual_faq_links(faq_files)
    
    # Process each FAQ file to create clean includes
    include_files = []
    for qmd_file in sorted(faq_files):
        output_file = create_clean_include(qmd_file, faq_dir)
        if output_file:
            include_files.append(output_file)
            print(f"Created: {output_file.name}")
    
    # Update the combined post to use clean includes
    update_combined_post(faq_dir, include_files)
    
    print(f"Pre-render complete: created {len(include_files)} clean include files")

if __name__ == "__main__":
    main()
