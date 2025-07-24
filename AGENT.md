# Hamel's Blog - Agent Documentation

This document provides guidance for AI agents and developers working on this Quarto-based blog.

## Site Structure

```
hamel-site/
├── blog/                       # Blog posts
│   ├── posts/
│   │   ├── evals-faq/         # AI Evals FAQ system
│   │   │   ├── _docs/         # Documentation (ignored by Quarto)
│   │   │   │   ├── AGENT.md   # FAQ system documentation
│   │   │   │   └── scripts.md # Utility scripts documentation
│   │   │   ├── scripts/       # Python utility scripts
│   │   │   ├── images/        # FAQ images
│   │   │   ├── *.qmd          # Individual FAQ files
│   │   │   ├── _*.md          # Generated include files (ignored)
│   │   │   └── index.qmd      # Combined FAQ post
│   │   └── [other-posts]/     # Other blog posts
│   └── index.qmd              # Blog homepage
├── notes/                     # Note-taking system
├── oss/                       # Open source projects
├── styles/                    # CSS customizations
├── _quarto.yml               # Main Quarto configuration
├── styles.css                # Site-wide CSS
└── index.qmd                 # Site homepage
```

## Key Systems

### AI Evals FAQ System

The most complex system in this blog is the AI Evals FAQ, which maintains both individual FAQ posts and a combined FAQ post for SEO optimization.

**Documentation**: See `blog/posts/evals-faq/_docs/AGENT.md`

**Key Features**:
- 29 individual FAQ posts for direct linking and SEO  
- Combined FAQ post for readability 
- Automatic include generation via pre-render script
- Link validation and maintenance scripts
- Context navigation between related FAQs
- Cross-reference system (anchors in combined, individual links in posts)

**When working with FAQs**:
1. Always read `blog/posts/evals-faq/_docs/AGENT.md` first
2. Use the utility scripts in `blog/posts/evals-faq/scripts/`
3. Run link validation after changes
4. Test both individual and combined post rendering

### Content Guidelines

- **Concise communication**: Keep responses direct and to the point
- **No unnecessary explanations**: Don't add code comments unless requested
- **Professional tone**: No emojis, minimal exclamation points
- **Helpful links**: Use proper file:// links when referencing code

### Common Tasks

**Adding a new blog post**:
1. Create `.qmd` file in `blog/posts/[topic]/`
2. Add proper frontmatter with categories, description, date
3. Test rendering with `quarto render`

**Adding a new FAQ** (complex process):
1. See detailed instructions in `blog/posts/evals-faq/_docs/AGENT.md`
2. Use the step-by-step guide for consistency
3. Always validate links after changes

**Updating site styles**:
1. Edit `styles.css` for site-wide changes
2. Edit theme files (`theme-*.scss`) for major design changes
3. Test in both light and dark modes

## Important Files

- `_quarto.yml`: Main configuration, includes pre-render script
- `styles.css`: Site-wide CSS customizations
- `.quartoignore`: Files to exclude from rendering (includes `_docs/` directories)
- `blog/posts/evals-faq/_docs/AGENT.md`: Comprehensive FAQ system documentation

## Development Workflow

1. **Before making changes**: Understand the system by reading relevant documentation
2. **During development**: Use available utility scripts and validation tools
3. **After changes**: Test rendering and run validation scripts
4. **For complex systems**: Follow specific documentation (like FAQ system)

## Contact

This is Hamel Husain's personal blog. For questions about the blog system, refer to the specific documentation files mentioned above.
