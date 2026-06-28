local M = {}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

-- advertise completion capabilities (snippets etc.) to language servers
M.capabilities = cmp_nvim_lsp.default_capabilities()

M.setup = function()
  -- diagnostic signs in the gutter
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn",  text = "" },
    { name = "DiagnosticSignHint",  text = "" },
    { name = "DiagnosticSignInfo",  text = "" },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  -- rounded borders on all floating windows (hover, signature help, diagnostics)
  vim.o.winborder = "rounded"

  vim.diagnostic.config({
    virtual_text     = false,  -- don't show inline diagnostic text (use gl to open float instead)
    signs            = true,
    update_in_insert = false,
    underline        = true,
    severity_sort    = true,
    float = {
      focusable = true,
      style     = "minimal",
      source    = "always",
      header    = "",
      prefix    = "",
    },
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD",          vim.lsp.buf.declaration,                   opts) -- go to declaration
  vim.keymap.set("n", "gd",          vim.lsp.buf.definition,                    opts) -- go to definition
  vim.keymap.set("n", "K",           vim.lsp.buf.hover,                         opts) -- show docs
  vim.keymap.set("n", "gI",          vim.lsp.buf.implementation,                opts) -- go to implementation
  vim.keymap.set("n", "gr",          vim.lsp.buf.references,                    opts) -- list references
  vim.keymap.set("n", "gl",          vim.diagnostic.open_float,                 opts) -- show diagnostic float
  vim.keymap.set("n", "<leader>lf",  function() vim.lsp.buf.format({ async = true }) end, opts) -- format file
  vim.keymap.set("n", "<leader>li",  "<cmd>LspInfo<CR>",                        opts) -- LSP info
  vim.keymap.set("n", "<leader>la",  vim.lsp.buf.code_action,                   opts) -- code actions
  vim.keymap.set("n", "<leader>lj",  vim.diagnostic.goto_next,                  opts) -- next diagnostic
  vim.keymap.set("n", "<leader>lk",  vim.diagnostic.goto_prev,                  opts) -- prev diagnostic
  vim.keymap.set("n", "<leader>lr",  vim.lsp.buf.rename,                        opts) -- rename symbol
  vim.keymap.set("n", "<leader>ls",  vim.lsp.buf.signature_help,                opts) -- signature help
  vim.keymap.set("n", "<leader>lq",  vim.diagnostic.setloclist,                 opts) -- send diagnostics to loclist
end

M.on_attach = function(client, bufnr)
  -- disable formatting for servers where none-ls handles it instead
  local format_disabled = { "pyright", "lua_ls", "texlab" }
  for _, name in ipairs(format_disabled) do
    if client.name == name then
      client.server_capabilities.documentFormattingProvider = false
    end
  end

  lsp_keymaps(bufnr)

  -- highlight other occurrences of word under cursor
  local illuminate_ok, illuminate = pcall(require, "illuminate")
  if illuminate_ok then
    illuminate.on_attach(client)
  end
end

return M
