# FAQ System Documentation for AI Agents

This directory contains a dual-structure FAQ system optimized for both SEO and user experience. Here's how it works and how to maintain it.

## System Overview

The FAQ system has two main components:
1. **Individual FAQ posts** (27 files) - each targeting specific SEO keywords
2. **Combined FAQ post** (`index.qmd`) - using includes for optimal reading experience

### Key Benefits
- **SEO**: Individual URLs for long-tail keyword targeting
- **UX**: Combined post for comprehensive reading
- **Maintenance**: Single-source content using Quarto includes

## Directory Structure

```
blog/posts/evals-faq/
├── index.qmd                    # Combined post (uses includes)
├── index.qmd.backup            # Original backup (DO NOT DELETE)
├── _faq-context.qmd            # Context include for individual posts
├── AGENT.md                    # This documentation file
├── scripts/                    # Utility scripts directory
│   ├── AGENT.md               # Scripts-specific documentation
│   ├── extract_faqs.py        # Split combined FAQ into individual posts  
│   ├── fix_anchor_links.py    # Fix internal cross-references
│   ├── check_faq_links.py     # Validate all links
│   ├── add_page_navigation.py # Add page navigation to posts
│   ├── add_faq_context.py     # Add context includes to posts
│   └── list_faq_titles.py     # List all FAQ titles and descriptions
├── images/                     # Shared images directory
└── [27 individual FAQ files]   # Individual posts for SEO
```

## File Naming Conventions

- **Individual FAQs**: Use kebab-case from question title
  - Example: `why-do-you-recommend-binary-passfail-evaluations-instead-of-1-5-ratings-likert-scales.qmd`
- **Includes**: Prefix with underscore (`_faq-context.qmd`)
- **Scripts**: Use snake_case (`extract_faqs.py`)

## Individual FAQ File Structure

Each individual FAQ file follows this template:

```yaml
---
title: "Q: [Question Title]"
description: "[150-char SEO description]"
categories: [LLMs, evals, faq]
author: 
  - Hamel Husain
  - Shreya Shankar
date: last-modified
image: images/eval_faq.png
exclude-from-listing: true
aliases:
  - /evals-faq/[kebab-case-slug]
page-navigation: true
---

[Content here - just the answer, no question header]

{{< include _faq-context.qmd >}}
```

### Key Frontmatter Fields
- `exclude-from-listing: true` - Keeps individual posts out of main blog listing
- `page-navigation: true` - Enables navigation between related FAQs
- `aliases` - Creates short URLs for each FAQ
- `description` - Must be ~150 characters for optimal SEO

## Combined Post Structure (`index.qmd`)

The combined post uses includes and has specific CTA placement:

```markdown
---
[Combined post frontmatter - no exclude-from-listing]
---

[Introduction]

[CTA #1 - Top]

`{{< include individual-faq-1.qmd >}}`
`{{< include individual-faq-2.qmd >}}`
...
[After "diverse user queries" FAQ]

[CTA #2 - Middle]

`{{< include remaining-faqs.qmd >}}`
...

[Footnotes]
```

## Adding New FAQs

### Method 1: Manual Addition

1. **Create individual FAQ file**:
   ```bash
   # Use kebab-case filename
   touch new-faq-question.qmd
   ```

2. **Add proper frontmatter** (see template above)

3. **Write content** (just the answer, no question header)

4. **Add context include** at the end:
   ```markdown
   `{{< include _faq-context.qmd >}}`
   ```

5. **Update combined post** (`index.qmd`):
   ```markdown
   `{{< include new-faq-question.qmd >}}`
   ```

6. **Test and validate** (see testing section below)

### Method 2: Using Extraction Script

If you have a combined FAQ post with new sections:

1. **Update the source content** in a temporary file
2. **Run extraction script**:
   ```bash
   python extract_faqs.py
   ```
3. **Review generated files** and update frontmatter as needed
4. **Test thoroughly**

## Available Utility Scripts

All utility scripts are located in the `scripts/` directory. Run them from that directory:

```bash
cd scripts/
```

### Core Scripts
- `extract_faqs.py` - Splits combined FAQ into individual posts
- `fix_anchor_links.py` - Updates internal cross-references
- `check_faq_links.py` - Validates all links (internal & external)
- `add_page_navigation.py` - Adds page navigation to posts
- `add_faq_context.py` - Adds context includes to posts
- `list_faq_titles.py` - Lists all FAQ titles and descriptions

For detailed script documentation, see `_docs/scripts.md`.

### Script Usage
```bash
# Change to scripts directory
cd scripts/

# Check all links
python check_faq_links.py

# Add page navigation to new files
python add_page_navigation.py

# Add context to new files  
python add_faq_context.py

# List all current FAQs
python list_faq_titles.py
```

## Testing & Validation

### Required Tests Before Committing

1. **Render Check**:
   ```bash
   quarto render --quiet
   # Should complete without errors
   ```

2. **Link Validation**:
   ```bash
   python check_faq_links.py
   # Should report 0 broken links
   ```

3. **Listing Verification**:
   - Check main blog listing excludes individual FAQs
   - Verify combined post appears correctly

4. **Navigation Test**:
   - Individual FAQ posts have page navigation
   - Context links work correctly
   - Aliases resolve properly

### Manual Checks
- [ ] Individual FAQ accessible at `/blog/posts/evals-faq/[slug].html`
- [ ] Short alias works `/evals-faq/[slug]`
- [ ] Combined post renders with all includes
- [ ] No individual FAQs in main blog listing
- [ ] All images and links work
- [ ] Context navigation present at bottom of individual posts

## SEO Considerations

### Individual Posts
- **Title**: Must start with "Q:" for consistency
- **Description**: ~150 characters, engaging preview of answer
- **URL**: Clean kebab-case slug
- **Meta**: All posts tagged with `[LLMs, evals, faq]`

### Link Structure
- **Internal cross-references**: Use full URLs to individual posts
- **Anchor links**: Convert to individual post URLs (never use `#anchors`)
- **External links**: Validate periodically

## Common Issues & Solutions

### 1. Broken Anchor Links
**Problem**: Cross-references using `#q-something` don't work
**Solution**: Convert to full URLs pointing to individual FAQ posts

### 2. Rendering Errors
**Problem**: Quarto fails to render
**Solution**: Check for YAML syntax errors, unescaped quotes in frontmatter

### 3. Missing Context
**Problem**: New FAQ doesn't have context navigation
**Solution**: Run `cd scripts/ && python add_faq_context.py`

### 4. Duplicate Content
**Problem**: FAQ appears in both individual post and combined post incorrectly
**Solution**: Ensure individual post only contains answer content, combined post uses includes

## Content Guidelines

### Writing Style
- **Consistent voice** with existing FAQs
- **Practical, actionable advice**
- **Sharp opinions with caveats** (match existing tone)
- **1-2 paragraph answers** typically work best

### Cross-References
- **Link to related FAQs** using individual post URLs
- **Reference external resources** when helpful
- **Maintain link context** even when content is split

### Images
- **Store in `images/` directory**
- **Use relative paths** in content
- **Optimize for web** (reasonable file sizes)

## Maintenance Schedule

### Regular Tasks
- **Monthly**: Run link checker for external URLs
- **After additions**: Validate all tests pass
- **Before releases**: Check sitemap includes new FAQs

### Archive/Backup
- **Never delete** `index.qmd.backup` (original source)
- **Keep utility scripts** for future maintenance
- **Document major changes** in commit messages

## Emergency Recovery

If the system breaks:

1. **Check `index.qmd.backup`** - contains original content
2. **Re-run extraction**: `cd scripts/ && python extract_faqs.py`
3. **Fix links**: `cd scripts/ && python fix_anchor_links.py`
4. **Validate**: `cd scripts/ && python check_faq_links.py`
5. **Test render**: `quarto render`

## Contact/Context

This system was built for SEO optimization while maintaining UX. The dual structure allows:
- Search engines to index individual FAQ pages
- Users to read the comprehensive guide
- Easy maintenance through includes and scripts

When in doubt, test thoroughly and maintain the existing patterns!
