def generate_testimonials(testimonials):
    template = """
::: {{.testimonial .g-col-12 .g-col-md-6}}

![]({image})

## _{name}, {title}_

### {quote}

:::
"""
    
    header = """::: {.content-block .grid .gap-4}
"""
    
    footer = """
:::
"""
    
    content = header
    for t in testimonials:
        content += template.format(**t)
    content += footer
    
    return content