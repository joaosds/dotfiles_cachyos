-- snippets are loaded in cmp.lua via:
-- require("luasnip.loaders.from_vscode").lazy_load()
-- This loads all snippets from friendly-snippets (Python, LaTeX, etc.)
--
-- To add custom snippets, use the luasnip API:
-- local ls = require("luasnip")
-- ls.add_snippets("python", { ls.snippet("main", { ls.text_node("if __name__ == '__main__':") }) })

local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

-- extend LaTeX snippets to also trigger in vimtex's tex filetype
luasnip.filetype_extend("tex", { "latex" })
