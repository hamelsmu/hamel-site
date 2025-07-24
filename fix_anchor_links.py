#!/usr/bin/env python3
import re
import os
from pathlib import Path

def slugify(text):
    """Convert text to URL-friendly slug"""
    # Remove "Q: " prefix and clean up
    text = re.sub(r'^Q:\s*', '', text)
    # Convert to lowercase and replace spaces/special chars with hyphens
    slug = re.sub(r'[^\w\s-]', '', text.lower())
    slug = re.sub(r'[-\s]+', '-', slug)
    return slug.strip('-')

def create_anchor_to_url_mapping():
    """Create mapping from anchor links to individual FAQ URLs"""
    # Manual mapping based on the actual anchor links found
    mapping = {
        "#q-how-can-i-efficiently-sample-production-traces-for-review": "/blog/posts/evals-faq/how-can-i-efficiently-sample-production-traces-for-review.html",
        "#q-how-do-i-debug-multi-turn-conversation-traces": "/blog/posts/evals-faq/how-do-i-debug-multi-turn-conversation-traces.html", 
        "#q-how-many-people-should-annotate-my-llm-outputs": "/blog/posts/evals-faq/how-many-people-should-annotate-my-llm-outputs.html",
        "#q-how-should-i-approach-evaluating-my-rag-system": "/blog/posts/evals-faq/how-should-i-approach-evaluating-my-rag-system.html",
        "#q-should-i-build-a-custom-annotation-tool-or-use-something-off-the-shelf": "/blog/posts/evals-faq/should-i-build-a-custom-annotation-tool-or-use-something-off-the-shelf.html",
        "#q-should-i-build-automated-evaluators-for-every-failure-mode-i-find": "/blog/posts/evals-faq/should-i-build-automated-evaluators-for-every-failure-mode-i-find.html",
        "#q-what-is-the-best-approach-for-generating-synthetic-data": "/blog/posts/evals-faq/what-is-the-best-approach-for-generating-synthetic-data.html",
        "#q-what-makes-a-good-custom-interface-for-reviewing-llm-outputs": "/blog/posts/evals-faq/what-makes-a-good-custom-interface-for-reviewing-llm-outputs.html", 
        "#q-whats-the-difference-between-guardrails--evaluators": "/blog/posts/evals-faq/whats-the-difference-between-guardrails-evaluators.html",
        "#q-why-do-you-recommend-binary-(passfail-evaluations-instead-of-1-5-ratings-(likert-scales": "/blog/posts/evals-faq/why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales.html",
        "#q-why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales": "/blog/posts/evals-faq/why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales.html",
        "#q-why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed": "/blog/posts/evals-faq/why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.html"
    }
    
    return mapping

def fix_links_in_file(file_path, anchor_mapping):
    """Fix anchor links in a single file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    
    # Find all anchor links and replace them
    for anchor_link, post_url in anchor_mapping.items():
        # Match the anchor link in markdown links like [text](#anchor)
        pattern = rf'\]\({re.escape(anchor_link)}\)'
        replacement = f']({post_url})'
        content = re.sub(pattern, replacement, content)
    
    # Write back if changed
    if content != original_content:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    return False

def main():
    # Create the mapping from anchor links to URLs
    anchor_mapping = create_anchor_to_url_mapping()
    
    print(f"Created mapping for {len(anchor_mapping)} anchor links")
    
    # Print the mapping for verification
    for anchor, url in list(anchor_mapping.items())[:5]:
        print(f"  {anchor} -> {url}")
    
    # Fix links in all individual FAQ files
    faq_dir = Path('blog/posts/evals-faq')
    individual_files = list(faq_dir.glob('*.qmd'))
    individual_files = [f for f in individual_files if f.name not in ['index.qmd', 'index.qmd.backup']]
    
    fixed_files = []
    for file_path in individual_files:
        if fix_links_in_file(file_path, anchor_mapping):
            fixed_files.append(file_path.name)
    
    # Also fix links in the combined file
    combined_file = faq_dir / 'index.qmd'
    if fix_links_in_file(combined_file, anchor_mapping):
        fixed_files.append('index.qmd')
    
    print(f"\nFixed anchor links in {len(fixed_files)} files:")
    for filename in fixed_files:
        print(f"  - {filename}")

if __name__ == "__main__":
    main()
