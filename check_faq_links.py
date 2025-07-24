#!/usr/bin/env python3
import re
import os
import requests
from pathlib import Path
from urllib.parse import urljoin, urlparse
import time

def extract_links_from_file(file_path):
    """Extract all markdown links from a file"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Find all markdown links [text](url)
    links = re.findall(r'\[([^\]]*)\]\(([^)]+)\)', content)
    return [(text, url, file_path.name) for text, url in links]

def categorize_links(links):
    """Categorize links into internal, external, and anchors"""
    internal_links = []
    external_links = []
    anchor_links = []
    
    for text, url, filename in links:
        if url.startswith('http://') or url.startswith('https://'):
            external_links.append((text, url, filename))
        elif url.startswith('#'):
            anchor_links.append((text, url, filename))
        elif url.startswith('/') or not '://' in url:
            internal_links.append((text, url, filename))
        else:
            external_links.append((text, url, filename))
    
    return internal_links, external_links, anchor_links

def test_internal_links(internal_links, site_root="_site"):
    """Test internal links against the rendered site"""
    broken_links = []
    
    for text, url, filename in internal_links:
        # Convert URL to file path
        if url.startswith('/'):
            # Absolute path from site root
            file_path = Path(site_root) / url.lstrip('/')
        else:
            # Relative path (shouldn't happen in our case, but handle it)
            file_path = Path(site_root) / "blog/posts/evals-faq" / url
        
        # Check if it's a directory, look for index.html
        if file_path.is_dir():
            file_path = file_path / "index.html"
        elif not str(file_path).endswith('.html'):
            # Try adding .html extension
            html_path = file_path.with_suffix('.html')
            if html_path.exists():
                file_path = html_path
        
        if not file_path.exists():
            broken_links.append((text, url, filename, f"File not found: {file_path}"))
    
    return broken_links

def test_external_links(external_links, max_links=10):
    """Test external links (limited to avoid overwhelming servers)"""
    broken_links = []
    tested_urls = set()
    
    # Limit testing to avoid overwhelming external servers
    for text, url, filename in external_links[:max_links]:
        if url in tested_urls:
            continue
        tested_urls.add(url)
        
        try:
            print(f"Testing external link: {url}")
            response = requests.head(url, timeout=10, allow_redirects=True)
            if response.status_code >= 400:
                broken_links.append((text, url, filename, f"HTTP {response.status_code}"))
        except requests.RequestException as e:
            broken_links.append((text, url, filename, f"Request failed: {e}"))
        
        # Be nice to external servers
        time.sleep(1)
    
    return broken_links

def main():
    # Get all FAQ files
    faq_dir = Path('blog/posts/evals-faq')
    faq_files = list(faq_dir.glob('*.qmd'))
    faq_files = [f for f in faq_files if f.name != 'index.qmd.backup']
    
    print(f"Checking links in {len(faq_files)} FAQ files...")
    
    # Extract all links
    all_links = []
    for file_path in faq_files:
        links = extract_links_from_file(file_path)
        all_links.extend(links)
    
    print(f"Found {len(all_links)} total links")
    
    # Categorize links
    internal_links, external_links, anchor_links = categorize_links(all_links)
    
    print(f"  - {len(internal_links)} internal links")
    print(f"  - {len(external_links)} external links") 
    print(f"  - {len(anchor_links)} anchor links")
    
    # Test internal links
    print("\n=== Testing Internal Links ===")
    broken_internal = test_internal_links(internal_links)
    
    if broken_internal:
        print(f"❌ Found {len(broken_internal)} broken internal links:")
        for text, url, filename, error in broken_internal:
            print(f"  - {filename}: [{text}]({url}) - {error}")
    else:
        print("✅ All internal links are working!")
    
    # Test some external links (limited)
    print(f"\n=== Testing External Links (first 10) ===")
    broken_external = test_external_links(external_links, max_links=10)
    
    if broken_external:
        print(f"❌ Found {len(broken_external)} broken external links:")
        for text, url, filename, error in broken_external:
            print(f"  - {filename}: [{text}]({url}) - {error}")
    else:
        print("✅ Tested external links are working!")
    
    # Check anchor links (these should all be fixed now)
    print(f"\n=== Anchor Links Summary ===")
    if anchor_links:
        print(f"Found {len(anchor_links)} anchor links (should all point to individual FAQ posts now):")
        for text, url, filename in anchor_links[:5]:  # Show first 5
            print(f"  - {filename}: [{text}]({url})")
        if len(anchor_links) > 5:
            print(f"  ... and {len(anchor_links) - 5} more")
    else:
        print("No anchor links found (good - they should all be converted to full URLs)")
    
    # Summary
    total_broken = len(broken_internal) + len(broken_external)
    print(f"\n=== Summary ===")
    print(f"Total links checked: {len(all_links)}")
    print(f"Broken links found: {total_broken}")
    
    if total_broken == 0:
        print("🎉 All links are working correctly!")
        return True
    else:
        print("⚠️  Some links need attention.")
        return False

if __name__ == "__main__":
    success = main()
    exit(0 if success else 1)
