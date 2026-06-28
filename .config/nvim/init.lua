require("user.options")      -- core vim settings (line numbers, tabs, clipboard, etc.)
require("user.keymaps")      -- custom keybindings and leader key
require("user.plugins")      -- plugin manager (lazy.nvim) and all plugin declarations
require("user.colorscheme")  -- color theme
require("user.telescope")    -- fuzzy finder for files, text, buffers
require("user.nvim-tree")    -- file explorer sidebar
require("user.comment")      -- toggle comments with a shortcut
require("user.lualine")      -- status bar at the bottom
require("user.bufferline")   -- buffer tabs at the top
require("user.cmp")          -- autocompletion engine (works with LSP and snippets)
require("user.treesitter")   -- syntax highlighting and code parsing
require("user.gitsigns")     -- git diff markers in the gutter
require("user.toggleterm")   -- terminal inside neovim
require("user.indentline")   -- indent guides
require("user.alpha")        -- startup dashboard
require("user.lsp")          -- language servers (pyright for Python, texlab for LaTeX)
require("user.whichkey")     -- popup showing available keybindings
require("user.vimtex")       -- LaTeX compilation and PDF sync
require("user.snippets")     -- code snippets (LuaSnip + friendly-snippets)
