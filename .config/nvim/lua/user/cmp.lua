local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
  return
end

-- load snippets from friendly-snippets (e.g. Python, LaTeX)
require("luasnip.loaders.from_vscode").lazy_load()

local kind_icons = {
  Text          = "",
  Method        = "",
  Function      = "",
  Constructor   = "",
  Field         = "",
  Variable      = "",
  Class         = "",
  Interface     = "",
  Module        = "",
  Property      = "",
  Unit          = "",
  Value         = "",
  Enum          = "",
  Keyword       = "",
  Snippet       = "",
  Color         = "",
  File          = "",
  Reference     = "",
  Folder        = "",
  EnumMember    = "",
  Constant      = "",
  Struct        = "",
  Event         = "",
  Operator      = "",
  TypeParameter = "",
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-k>"]     = cmp.mapping.select_prev_item(),       -- move up in completion list
    ["<C-j>"]     = cmp.mapping.select_next_item(),       -- move down in completion list
    ["<C-b>"]     = cmp.mapping.scroll_docs(-1),          -- scroll docs up
    ["<C-f>"]     = cmp.mapping.scroll_docs(1),           -- scroll docs down
    ["<C-Space>"] = cmp.mapping.complete(),               -- trigger completion manually
    ["<C-e>"]     = cmp.mapping.abort(),                  -- close completion
    ["<CR>"]      = cmp.mapping.confirm({ select = true }),-- confirm selected item

    -- Tab: cycle completions or jump through snippet placeholders
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Shift-Tab: cycle backwards or jump back through snippet placeholders
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "[LSP]",    -- completions from language server
        nvim_lua = "[Lua]",    -- neovim lua API completions
        luasnip  = "[Snip]",   -- snippet completions
        buffer   = "[Buf]",    -- completions from open buffers
        path     = "[Path]",   -- filepath completions
      })[entry.source.name]
      return vim_item
    end,
  },

  sources = {
    { name = "nvim_lsp" },  -- highest priority: LSP suggestions
    { name = "nvim_lua" },  -- neovim API (useful when editing this config)
    { name = "luasnip" },   -- snippets
    { name = "buffer" },    -- words from open buffers
    { name = "path" },      -- file paths
  },

  window = {
    completion    = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  experimental = {
    ghost_text = true,  -- show completion preview as faded text inline
  },
})
