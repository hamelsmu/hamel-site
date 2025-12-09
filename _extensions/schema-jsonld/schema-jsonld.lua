-- BlogPosting Schema JSON-LD filter for Quarto
-- Generates schema.org BlogPosting structured data from post metadata

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

  -- Get author from metadata, with fallback to default
  local author_name = "Hamel Husain"
  local author_url = "https://hamel.dev"
  if meta.author then
    local author = meta.author
    local author_type = pandoc.utils.type(author)
    
    -- Handle list of authors (MetaList) - use first author
    if author_type == "List" and author[1] then
      author = author[1]
      author_type = pandoc.utils.type(author)
    end
    
    -- Extract name and URL from author
    if author_type == "table" and author.name then
      -- Structured author: {name: "...", url: "..."}
      author_name = stringify(author.name)
      if author.url then
        author_url = stringify(author.url)
      end
    elseif author_type == "Inlines" then
      -- Simple string author: "Hamel Husain"
      author_name = stringify(author)
    elseif author_type == "string" then
      author_name = author
    end
  end

  local function escape_json(s)
    if not s then return "" end
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
    "name": "%s",
    "url": "%s"
  },
  "publisher": {
    "@type": "Person",
    "name": "%s"
  },
  "mainEntityOfPage": {
    "@type": "WebPage"
  }
}
</script>]],
    escape_json(title),
    escape_json(description),
    escape_json(date),
    escape_json(date_modified),
    escape_json(author_name),
    escape_json(author_url),
    escape_json(author_name)
  )

  local block = pandoc.RawBlock("html", json)
  
  -- Handle header-includes safely (may be MetaList, MetaBlocks, or nil)
  local hi = meta["header-includes"]
  if not hi then
    hi = pandoc.List{}
  elseif pandoc.utils.type(hi) ~= "List" then
    hi = pandoc.List{hi}
  end
  hi:insert(block)
  meta["header-includes"] = hi

  return meta
end
