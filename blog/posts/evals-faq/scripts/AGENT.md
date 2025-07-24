# FAQ Scripts Documentation

This directory contains utility scripts for maintaining the FAQ system. All scripts are designed to be run from this `scripts/` directory.

## Available Scripts

### Core Maintenance Scripts

#### `extract_faqs.py`
Splits a combined FAQ post into individual posts.

```bash
python extract_faqs.py
```

**What it does:**
- Reads `../index.qmd.backup` (original combined post)
- Extracts each Q&A section starting with `## Q:`
- Creates individual `.qmd` files with proper frontmatter
- Generates include statements for the combined post
- Creates backup of original file

**When to use:**
- Major restructuring of FAQ content
- Adding multiple new FAQs from a combined source
- Recovering from system issues

#### `fix_anchor_links.py`
Converts internal anchor links to individual FAQ post URLs.

```bash
python fix_anchor_links.py
```

**What it does:**
- Maps anchor links like `#q-something` to individual post URLs
- Updates cross-references in all FAQ files
- Ensures internal navigation works correctly

**When to use:**
- After adding new FAQs with cross-references
- When anchor links are broken
- After restructuring content

#### `check_faq_links.py`
Comprehensive link validation for all FAQ posts.

```bash
python check_faq_links.py
```

**What it does:**
- Tests all internal links (31+ typically)
- Validates external links (sample of 10)
- Reports broken links with details
- Categorizes links (internal/external/anchor)

**When to use:**
- Before committing changes
- Monthly maintenance checks
- After major content updates
- Troubleshooting broken links

### Enhancement Scripts

#### `add_page_navigation.py`
Adds page navigation to individual FAQ posts.

```bash
python add_page_navigation.py
```

**What it does:**
- Adds `page-navigation: true` to frontmatter
- Enables navigation between related FAQ posts
- Skips files that already have navigation

**When to use:**
- After creating new individual FAQ files
- When navigation is missing from posts

#### `add_faq_context.py`
Adds context navigation to individual FAQ posts.

```bash
python add_faq_context.py
```

**What it does:**
- Adds `` `{{< include _faq-context.qmd >}}` `` to end of posts
- Provides navigation back to main FAQ guide
- Skips files that already have context

**When to use:**
- After creating new individual FAQ files
- When context navigation is missing

#### `list_faq_titles.py`
Lists all FAQ titles and descriptions for review.

```bash
python list_faq_titles.py
```

**What it does:**
- Extracts titles and descriptions from all FAQ files
- Displays formatted list with file names
- Useful for content auditing and SEO review

**When to use:**
- Content review and auditing
- SEO description optimization
- Getting overview of all FAQs

## Usage Patterns

### Adding a Single New FAQ

1. **Create the file manually**:
   ```bash
   touch ../new-faq-name.qmd
   ```

2. **Add proper frontmatter** (see main AGENT.md for template)

3. **Add navigation and context**:
   ```bash
   python add_page_navigation.py
   python add_faq_context.py
   ```

4. **Update combined post** (`../index.qmd`) to include the new FAQ

5. **Validate**:
   ```bash
   python check_faq_links.py
   ```

### Bulk FAQ Addition

1. **Use extraction method**:
   ```bash
   python extract_faqs.py
   ```

2. **Fix any anchor links**:
   ```bash
   python fix_anchor_links.py
   ```

3. **Validate everything**:
   ```bash
   python check_faq_links.py
   ```

### Maintenance Routine

Monthly maintenance checklist:

```bash
# 1. Check all links
python check_faq_links.py

# 2. Review content
python list_faq_titles.py

# 3. Ensure all posts have proper navigation
python add_page_navigation.py
python add_faq_context.py
```

## Script Architecture

### Path Management
All scripts use relative paths from the `scripts/` directory:
- `../` refers to the FAQ directory
- `../_site/` refers to the rendered site
- Scripts are location-independent and safe to move

### Error Handling
Scripts include:
- File existence checks
- YAML parsing validation
- Graceful handling of missing files
- Informative error messages

### Safety Features
- Backup creation before major changes
- Idempotent operations (safe to run multiple times)
- Dry-run capabilities where applicable
- Rollback instructions in main AGENT.md

## Development Notes

### Adding New Scripts
When creating new scripts:

1. **Use relative paths** from scripts directory
2. **Follow naming convention**: `verb_noun.py`
3. **Include docstrings** and help text
4. **Make operations idempotent**
5. **Add to this documentation**

### Path Conventions
```python
# Correct - relative from scripts/
faq_dir = Path('../')
index_file = Path('../index.qmd')

# Incorrect - absolute paths
faq_dir = Path('blog/posts/evals-faq')
```

### Testing Scripts
Always test scripts with:

```bash
# Run from scripts directory
cd blog/posts/evals-faq/scripts

# Test individual script
python script_name.py

# Validate results
cd ..
quarto render --quiet
```

## Troubleshooting

### Common Issues

**"Path not found" errors:**
- Ensure you're running from the `scripts/` directory
- Check that FAQ files exist in parent directory

**YAML parsing errors:**
- Check frontmatter syntax in FAQ files
- Look for unescaped quotes or malformed YAML

**Link validation failures:**
- Run `fix_anchor_links.py` first
- Check for missing image files
- Verify external URLs are accessible

### Recovery Procedures

If scripts break the system:

1. **Check backup files** (especially `../index.qmd.backup`)
2. **Re-run extraction**: `python extract_faqs.py`
3. **Fix links**: `python fix_anchor_links.py`
4. **Validate**: `python check_faq_links.py`
5. **Test render**: `cd .. && quarto render`

## Integration

These scripts integrate with:
- **Quarto rendering system** (validates output)
- **Git workflow** (safe for version control)
- **SEO optimization** (maintains URL structure)
- **Site navigation** (preserves user experience)

For complete system documentation, see `../AGENT.md`.
