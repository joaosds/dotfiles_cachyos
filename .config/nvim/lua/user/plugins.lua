-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- ── Core utilities ────────────────────────────────────────────────────────
  "nvim-lua/plenary.nvim",          -- lua utility functions used by many plugins
  "nvim-tree/nvim-web-devicons",    -- file icons

  -- ── File explorer ─────────────────────────────────────────────────────────
  "nvim-tree/nvim-tree.lua",        -- sidebar file explorer

  -- ── Fuzzy finder ──────────────────────────────────────────────────────────
  "nvim-telescope/telescope.nvim",  -- fuzzy search for files, text, buffers

  -- ── Syntax highlighting ───────────────────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",            -- auto-update parsers after install
  },

  -- ── LSP ───────────────────────────────────────────────────────────────────
  "neovim/nvim-lspconfig",          -- LSP client configuration
  {
    "williamboman/mason.nvim",      -- installs language servers, linters, formatters
    build = ":MasonUpdate",
  },
  "williamboman/mason-lspconfig.nvim", -- bridges mason with lspconfig
  {
    "nvimtools/none-ls.nvim",       -- formatters and linters as LSP sources (null-ls fork)
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- ── Autocompletion ────────────────────────────────────────────────────────
  "hrsh7th/nvim-cmp",               -- completion engine
  "hrsh7th/cmp-nvim-lsp",           -- LSP completions
  "hrsh7th/cmp-buffer",             -- completions from open buffers
  "hrsh7th/cmp-path",               -- filepath completions
  "hrsh7th/cmp-nvim-lua",           -- neovim lua API completions

  -- ── Snippets ──────────────────────────────────────────────────────────────
  "L3MON4D3/LuaSnip",               -- snippet engine
  "saadparwaiz1/cmp_luasnip",       -- connects LuaSnip to cmp
  "rafamadriz/friendly-snippets",   -- collection of snippets for many languages

  -- ── LaTeX ─────────────────────────────────────────────────────────────────
  "lervag/vimtex",                  -- LaTeX compilation, PDF sync, ToC

  -- ── UI ────────────────────────────────────────────────────────────────────
  "nvim-lualine/lualine.nvim",      -- status bar
  "akinsho/bufferline.nvim",        -- buffer tabs at the top
  "moll/vim-bbye",                  -- close buffers without closing the window
  "goolord/alpha-nvim",             -- startup dashboard
  "lukas-reineke/indent-blankline.nvim", -- indent guides
  "folke/which-key.nvim",           -- popup showing available keybindings

  -- ── Colorschemes ──────────────────────────────────────────────────────────
  "folke/tokyonight.nvim",
  "rebelot/kanagawa.nvim",
  "tomasiser/vim-code-dark",

  -- ── Git ───────────────────────────────────────────────────────────────────
  "lewis6991/gitsigns.nvim",        -- git diff markers in the gutter

  -- ── Terminal ──────────────────────────────────────────────────────────────
  "akinsho/toggleterm.nvim",        -- floating/split terminal inside neovim

  -- ── Editing helpers ───────────────────────────────────────────────────────
  "numToStr/Comment.nvim",          -- toggle comments with gcc/gc
  "windwp/nvim-autopairs",          -- auto-close brackets, quotes, etc.
  "RRethy/vim-illuminate",          -- highlight other occurrences of word under cursor

}, {
  ui = {
    border = "rounded",
  },
  rocks = {
    enabled = false,  -- disable luarocks support (not needed for our plugins)
  },
})
