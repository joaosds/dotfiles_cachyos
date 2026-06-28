local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  -- only install parsers we actually use
  ensure_installed = {
    "python",   -- Python syntax
    "lua",      -- for editing this neovim config
    "bash",     -- shell scripts
    "markdown", -- markdown files
    "json",
    "yaml",
    "toml",
  },
  -- latex is intentionally excluded: vimtex handles LaTeX highlighting better

  sync_install = false,  -- install parsers in the background

  highlight = {
    enable = true,
    disable = { "latex" },  -- let vimtex handle LaTeX highlighting
  },

  indent = {
    enable = true,
    disable = { "python" },  -- python indentation is tricky, let smartindent handle it
  },
})
