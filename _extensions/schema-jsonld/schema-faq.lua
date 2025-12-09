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

local function blocks_to_text(blocks)
  if not blocks or #blocks == 0 then
    return ""
  end
  local doc = pandoc.Pandoc(blocks)
  local html = pandoc.write(doc, "html")
  html = html:gsub("^%s+", ""):gsub("%s+$", "")
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

  if not meta["header-includes"] then
    meta["header-includes"] = {}
  end
  table.insert(meta["header-includes"], block)

  doc.meta = meta
  return doc
end
