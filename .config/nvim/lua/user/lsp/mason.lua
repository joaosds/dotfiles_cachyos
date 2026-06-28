local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

local handlers = require("user.lsp.handlers")

mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed   = "",
      package_pending     = "",
      package_uninstalled = "",
    },
  },
})

-- mason-lspconfig installs the servers automatically
mason_lspconfig.setup({
  ensure_installed = {
    "pyright",  -- Python
    "texlab",   -- LaTeX
    "lua_ls",   -- Lua (for editing this neovim config)
    "bashls",   -- Bash scripts
  },
  automatic_installation = true,
})

-- global config applied to every server (on_attach + cmp capabilities)
vim.lsp.config("*", {
  on_attach    = handlers.on_attach,
  capabilities = handlers.capabilities,
})

-- per-server settings
vim.lsp.config("pyright", {
  settings = require("user.lsp.settings.pyright"),
})

vim.lsp.config("texlab", {
  settings = require("user.lsp.settings.texlab"),
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },   -- don't warn about the vim global
      workspace   = { checkThirdParty = false },
      telemetry   = { enable = false },
    },
  },
})

-- enable all servers (lspconfig registers their cmd/filetypes/root_markers)
vim.lsp.enable({ "pyright", "texlab", "lua_ls", "bashls" })
