function Meta(meta)
  if not quarto.doc.is_format("html") then
    return meta
  end

  if not meta.title or not meta.date then
    return meta
  end

  local stringify = pandoc.utils.stringify

  local title = stringify(meta.title)
  local description = meta.description and stringify(meta.description) or ""
  local date = stringify(meta.date)
  local date_modified = meta["date-modified"] and stringify(meta["date-modified"]) or date

  local function escape_json(s)
    s = s:gsub('\\', '\\\\')
    s = s:gsub('"', '\\"')
    s = s:gsub('\n', '\\n')
    s = s:gsub('\r', '\\r')
    s = s:gsub('\t', '\\t')
    s = s:gsub('</', '<\\/')
    return s
  end

  local json = string.format([[
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "headline": "%s",
  "description": "%s",
  "datePublished": "%s",
  "dateModified": "%s",
  "author": {
    "@type": "Person",
    "name": "Hamel Husain",
    "url": "https://hamel.dev"
  },
  "publisher": {
    "@type": "Person",
    "name": "Hamel Husain"
  },
  "mainEntityOfPage": {
    "@type": "WebPage"
  }
}
</script>]],
    escape_json(title),
    escape_json(description),
    escape_json(date),
    escape_json(date_modified)
  )

  local block = pandoc.RawBlock("html", json)
  
  if not meta["header-includes"] then
    meta["header-includes"] = {}
  end
  table.insert(meta["header-includes"], block)

  return meta
end
