-- FAQ Schema (FAQPage) Lua filter for Quarto
-- Generates schema.org FAQPage JSON-LD for pages with faq-index: true

local questions = {}
local current_question = nil

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

local function stringify_inlines(inlines)
  return pandoc.utils.stringify(inlines)
end

-- Check if a Div is a Quarto custom block (shortcodes, conditional blocks, etc.)
local function is_quarto_custom_div(el)
  if el.t ~= "Div" then
    return false
  end
  -- Prefer el.attr.attributes (Pandoc standard); fall back to el.attributes if Quarto exposes it
  local attrs = (el.attr and el.attr.attributes) or el.attributes or {}
  for k, _ in pairs(attrs) do
    if k:match("^data%-__quarto") then
      return true
    end
  end
  return false
end

-- Recursively filter out Quarto custom blocks from a list of blocks
local function filter_quarto_blocks(blocks)
  local filtered = pandoc.List{}
  for _, block in ipairs(blocks) do
    if is_quarto_custom_div(block) then
      -- Skip Quarto custom divs entirely
    elseif block.t == "Div" then
      -- Recursively filter content inside regular Divs
      block.content = filter_quarto_blocks(block.content)
      if #block.content > 0 then
        filtered:insert(block)
      end
    else
      filtered:insert(block)
    end
  end
  return filtered
end

-- Clean up HTML output: remove Quarto-specific markup and simplify for structured data
local function clean_html(html)
  -- Remove Quarto internal elements (navigation, meta) using non-greedy patterns
  html = html:gsub('<div id="quarto%-[%w%-]+"[^>]*>.-</div>', '')
  html = html:gsub('<div class="hidden quarto[^"]*"[^>]*>.-</div>', '')
  
  -- Remove all data-__quarto* attributes
  html = html:gsub('%s+data%-__quarto[%w_%-]*="[^"]*"', '')
  -- Remove other data-* attributes  
  html = html:gsub('%s+data%-[%w%-]+="[^"]*"', '')
  
  -- Remove grid/layout div classes (but keep the structure balanced)
  html = html:gsub(' class="grid"', '')
  html = html:gsub(' class="g%-col%-[%d]+"', '')
  
  -- Remove empty class attributes
  html = html:gsub('%s+class=""', '')
  
  -- Remove empty spans
  html = html:gsub('<span>%s*</span>', '')
  
  -- Remove aria-hidden figure captions (accessibility attribute not needed in JSON)
  html = html:gsub('%s+aria%-hidden="[^"]*"', '')
  
  -- Clean up empty divs (only truly empty ones)
  html = html:gsub('<div>%s*</div>', '')
  
  -- Collapse multiple newlines/whitespace
  html = html:gsub('\n%s*\n', '\n')
  html = html:gsub('%s+', ' ')
  
  -- Trim
  html = html:gsub("^%s+", ""):gsub("%s+$", "")
  return html
end

local function blocks_to_text(blocks)
  if not blocks or #blocks == 0 then
    return ""
  end
  -- Filter out Quarto custom blocks before converting to HTML
  local filtered = filter_quarto_blocks(blocks)
  if #filtered == 0 then
    return ""
  end
  local doc = pandoc.Pandoc(filtered)
  local html = pandoc.write(doc, "html")
  html = clean_html(html)
  return html
end

local function flush_question()
  if current_question and current_question.name then
    local answer_html = blocks_to_text(current_question.blocks)
    if answer_html and answer_html ~= "" then
      table.insert(questions, {
        name = current_question.name,
        answer = answer_html
      })
    end
  end
  current_question = nil
end

local function is_question_header(el)
  if el.t ~= "Header" then
    return false, nil
  end
  if el.level < 2 then
    return false, nil
  end
  local text = stringify_inlines(el.content)
  local question = text:match("^%s*Q:%s*(.+)")
  if question then
    return true, question
  end
  return false, nil
end

function Pandoc(doc)
  if not quarto.doc.is_format("html") then
    return doc
  end

  local meta = doc.meta
  if not meta["faq-index"] then
    return doc
  end

  questions = {}
  current_question = nil

  for _, block in ipairs(doc.blocks) do
    local is_q, q_text = is_question_header(block)
    if is_q then
      flush_question()
      current_question = {
        name = q_text,
        blocks = {}
      }
    elseif current_question then
      local dominated_by_link = false
      if block.t == "Para" and #block.content == 1 then
        local child = block.content[1]
        if child.t == "Link" then
          local classes = child.attr and child.attr.classes or {}
          for _, cls in ipairs(classes) do
            if cls == "faq-individual-link" or cls == "faq-back-link" then
              dominated_by_link = true
              break
            end
          end
        end
      end
      if not dominated_by_link then
        table.insert(current_question.blocks, block)
      end
    end
  end
  flush_question()

  if #questions == 0 then
    return doc
  end

  local main_entity_parts = {}
  for _, q in ipairs(questions) do
    local entry = string.format([[
    {
      "@type": "Question",
      "name": "%s",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "%s"
      }
    }]], escape_json(q.name), escape_json(q.answer))
    table.insert(main_entity_parts, entry)
  end

  local faq_json = string.format([[
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
%s
  ]
}
</script>]], table.concat(main_entity_parts, ",\n"))

  local block = pandoc.RawBlock("html", faq_json)

  -- Handle header-includes safely (may be MetaList, MetaBlocks, or nil)
  local hi = meta["header-includes"]
  if not hi then
    hi = pandoc.List{}
  elseif pandoc.utils.type(hi) ~= "List" then
    hi = pandoc.List{hi}
  end
  hi:insert(block)
  meta["header-includes"] = hi

  doc.meta = meta
  return doc
end
