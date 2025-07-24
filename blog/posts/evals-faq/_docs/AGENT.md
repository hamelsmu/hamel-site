# FAQ System Documentation for AI Agents

This directory contains a dual-structure FAQ system optimized for both SEO and user experience. Here's how it works and how to maintain it.

## System Overview

The FAQ system has two main components:
1. **Individual FAQ posts** (29 files) - each targeting specific SEO keywords
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
├── _docs/
├── scripts/                    # Utility scripts directory
│   │   ├── AGENT.md           # This documentation file
│   │   └── scripts.md         # Scripts-specific documentation
│   ├── extract_faqs.py        # Split combined FAQ into individual posts  
│   ├── fix_anchor_links.py    # Fix internal cross-references
│   ├── check_faq_links.py     # Validate all links
│   ├── add_page_navigation.py # Add page navigation to posts
│   ├── add_faq_context.py     # Add context includes to posts
│   └── list_faq_titles.py     # List all FAQ titles and descriptions
├── images/                     # Shared images directory
└── [29 individual FAQ files]   # Individual posts for SEO
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
categories: [LLMs, evals, faq, faq-individual]
date: last-modified
image: images/eval_faq.png
exclude-from-listing: true
aliases:
  - /evals-faq/[kebab-case-slug]
page-navigation: true
toc: true
toc-expand: 2
toc-depth: 3
toc-location: right
---

[Content here - just the answer, no question header]

`{{< include _faq-context.qmd >}}`
```

### Key Frontmatter Fields
- `exclude-from-listing: true` - Keeps individual posts out of main blog listing
- `page-navigation: true` - Enables navigation between related FAQs
- `aliases` - Creates short URLs for each FAQ
- `toc: true` - Enables table of contents
- `toc-expand: 2` - Auto-expands TOC to level 2
- `toc-depth: 3` - Shows headings up to H3 in TOC
- `toc-location: right` - Places TOC on right side

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

### Step-by-Step Guide for New FAQ

**For both humans and LLMs:** Follow these exact steps to add a new FAQ while maintaining system consistency.

1. **Create individual FAQ file**:
   ```bash
   # Use kebab-case filename matching the question
   # Example: how-do-i-evaluate-multimodal-llm-outputs.qmd
   touch blog/posts/evals-faq/new-faq-question.qmd
   ```

2. **Add proper frontmatter** (use this exact template, no author or description field):
   ```yaml
   ---
   title: "Q: [Your Question Here]"
   categories: [LLMs, evals, faq, faq-individual]
   date: last-modified
   image: images/eval_faq.png
   exclude-from-listing: true
   aliases:
     - /evals-faq/[kebab-case-slug]
   page-navigation: true
   toc: true
   toc-expand: 2
   toc-depth: 3
   toc-location: right
   ---
   ```

3. **Write content** (just the answer, question already in title):
   ```markdown
   Your answer content here. Focus on practical, actionable advice.
   
   Use consistent voice with existing FAQs. Include links to related FAQs using:
   [related topic](/blog/posts/evals-faq/related-topic.html)
   
   [↩ Back to main FAQ](/blog/posts/evals-faq/#anchor-id){target="_blank" .faq-back-link}
   
   {{< include _faq-context.qmd >}}
   ```

   **Important formatting notes:**
   - Use `{target="_blank" .faq-back-link}` format (not separate braces)
   - No author or description fields in frontmatter
   - Individual FAQs should link to other individual posts, not anchors
   - Back link anchor should match the filename pattern: `#q-filename-without-extension`

4. **Add to combined post** (`index.qmd`):
   ```markdown
   # Find the appropriate section and add:
   `{{< include new-faq-question.qmd >}}`
   ```

5. **Run the system** (this regenerates includes):
   ```bash
   quarto render blog/posts/evals-faq/index.qmd
   ```

6. **Run post-creation fixes** (covers functionality from removed scripts):
   ```bash
   cd blog/posts/evals-faq/scripts
   
   # Fix cross-references (individual FAQs should link to other individual posts)
   python fix_cross_references.py
   
   # Add missing context navigation if needed
   python add_faq_context.py
   
   # Add back links if needed
   python add_back_links.py
   ```

7. **Validate everything works**:
   ```bash
   cd blog/posts/evals-faq/scripts
   python check_faq_links.py
   ```

### Method 2: Using Extraction Script (Advanced)

If you have a combined FAQ post with new sections:

1. **Update the source content** in a temporary file
2. **Run extraction script**:
   ```bash
   cd blog/posts/evals-faq/scripts
   python extract_faqs.py
   ```
3. **Review generated files** and update frontmatter as needed
4. **Test thoroughly**

### Key Rules

- **Filename**: Use kebab-case matching the question
- **Categories**: Always include `[LLMs, evals, faq, faq-individual]` (all 4 tags required)
- **Frontmatter completeness**: Must include all fields from template (no author/description fields)
- **TOC settings**: All 4 TOC fields required (toc, toc-expand, toc-depth, toc-location)
- **Exclusions**: Must have `exclude-from-listing: true` to hide from main blog
- **Context include**: Always end with `{{< include _faq-context.qmd >}}`
- **Links**: Use individual post URLs to other FAQs, not anchor links
- **Back link**: Must use combined attribute format `{target="_blank" .faq-back-link}`
- **Testing**: Always run post-creation scripts and link validation

### New FAQ Checklist

When creating a new FAQ, verify it has:
- [ ] Proper kebab-case filename
- [ ] Complete frontmatter with all 11 required fields
- [ ] `faq-individual` in categories
- [ ] All 4 TOC settings present
- [ ] `exclude-from-listing: true`
- [ ] Content with proper cross-reference links to individual posts
- [ ] Back link with correct anchor and combined attributes
- [ ] Context include at the end
- [ ] Added to combined post `index.qmd`
- [ ] Post-creation scripts run successfully
- [ ] Link validation passes

## Available Utility Scripts

All utility scripts are located in the `scripts/` directory. Run them from that directory:

```bash
cd scripts/
```

### Core Scripts
- `extract_faqs.py` - Splits combined FAQ into individual posts
- `check_faq_links.py` - Validates all links (internal & external)
- `add_page_navigation.py` - Adds page navigation to posts
- `add_faq_context.py` - Adds context includes to posts
- `add_back_links.py` - Adds back links to individual FAQs pointing to main post anchors
- `add_target_blank.py` - Adds target="_blank" to external links for better UX
- `fix_cross_references.py` - Fixes FAQ cross-references for individual vs combined pages
- `list_faq_titles.py` - Lists all FAQ titles and descriptions

### Maintenance Scripts
- `fix_include_links.py` - Converts individual post links to anchors in includes
- `fix_malformed_links.py` - Repairs malformed links in include files

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
- **Individual FAQ pages**: Links to other FAQs use individual post URLs (`/blog/posts/evals-faq/other-faq.html`)
- **Combined FAQ page**: Links use anchor links (`#q-other-faq`) to stay on same page
- **Cross-reference system**: Automatic conversion handled by pre-render script
- **External links**: Validate periodically

## Common Issues & Solutions

### 1. Broken Cross-References
**Problem**: Links between FAQs don't work properly
**Solution**: Run `cd scripts/ && python fix_cross_references.py` and regenerate includes

### 2. Malformed Links in Combined FAQ
**Problem**: Links appear as `(filename.qmd){target="_blank"}` instead of proper anchors
**Solution**: Run `cd scripts/ && python fix_malformed_links.py`

### 3. Missing TOC or Navigation
**Problem**: New FAQ doesn't have table of contents or navigation
**Solution**: Run `cd scripts/ && python add_toc_settings.py && python add_faq_context.py`

### 4. Rendering Errors
**Problem**: Quarto fails to render
**Solution**: Check for YAML syntax errors, unescaped quotes in frontmatter

### 5. Include Files Out of Sync
**Problem**: Combined FAQ shows outdated content
**Solution**: Run the pre-render script: `python blog/posts/evals-faq/prepare-faq-includes.py`

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
3. **Fix links**: `cd scripts/ && python fix_cross_references.py`
4. **Fix malformed links**: `cd scripts/ && python fix_malformed_links.py`
5. **Validate**: `cd scripts/ && python check_faq_links.py`
6. **Test render**: `quarto render`

## Contact/Context

This system was built for SEO optimization while maintaining UX. The dual structure allows:
- Search engines to index individual FAQ pages
- Users to read the comprehensive guide
- Easy maintenance through includes and scripts

When in doubt, test thoroughly and maintain the existing patterns!
