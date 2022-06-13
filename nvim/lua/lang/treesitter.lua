local treesitter_context = function(width)
  if not packer_plugins["nvim-treesitter"] or packer_plugins["nvim-treesitter"].loaded == false then
    return " "
  end
  local type_patterns = {
    "class",
    "function",
    "method",
    "interface",
    "type_spec",
    "table",
    "if_statement",
    "for_statement",
    "for_in_statement",
    "call_expression",
    "comment",
  }

  if vim.o.ft == "json" then
    type_patterns = { "object", "pair" }
  end

  local f = require("nvim-treesitter").statusline({
    indicator_size = width,
    type_patterns = type_patterns,
  })
  local context = string.format("%s", f) -- convert to string, it may be a empty ts node

  -- lprint(context)
  if context == "vim.NIL" then
    return " "
  end

  return context
end

return {
  context = treesitter_context
}
