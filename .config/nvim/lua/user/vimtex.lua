-- vimtex: LaTeX compilation, PDF sync, ToC
-- Compiler:   <leader>ll  — start/stop compilation
-- View PDF:   <leader>lv  — forward search (jump to current position in PDF)
-- ToC:        <leader>lt  — open table of contents
-- Clean:      <leader>lc  — remove aux files
-- Inverse search is triggered from Zathura by Ctrl+clicking the PDF

vim.g.vimtex_view_method = "zathura"   -- use Zathura for PDF viewing and synctex

vim.g.vimtex_compiler_latexmk = {
  options = {
    "-pdf",
    "-shell-escape",
    "-verbose",
    "-file-line-error",
    "-synctex=1",               -- required for forward/inverse search
    "-interaction=nonstopmode",
  },
}

-- conceal LaTeX syntax for cleaner reading (e.g. show α instead of \alpha)
vim.g.vimtex_syntax_conceal = {
  accents        = 1,
  ligatures      = 1,
  cites          = 1,
  fancy          = 1,
  greek          = 1,
  math_bounds    = 1,
  math_delimiters = 1,
  math_fracs     = 1,
  math_super_sub = 1,
  math_symbols   = 1,
  sections       = 0,
  styles         = 1,
}
vim.opt.conceallevel = 2  -- enable concealment (vimtex needs this)

vim.g.vimtex_toc_config = {
  name       = "ToC",
  layers     = { "content", "todo", "include" },
  show_help  = false,
}
