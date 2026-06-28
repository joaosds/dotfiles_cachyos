local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local formatting   = null_ls.builtins.formatting
local diagnostics  = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    -- Python
    formatting.black.with({ extra_args = { "--fast" } }),  -- opinionated Python formatter
    diagnostics.flake8,                                    -- Python linter

    -- Lua (for editing this config)
    formatting.stylua,

    -- Shell
    formatting.shfmt,
    diagnostics.shellcheck,
  },
})
