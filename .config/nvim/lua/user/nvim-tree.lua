local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  disable_netrw = true,   -- disable vim's built-in file explorer
  hijack_netrw = true,    -- use nvim-tree instead when opening directories

  filters = {
    custom = { ".git" },  -- hide .git folder in the tree
  },

  update_focused_file = {
    enable = true,         -- highlight the current file in the tree
    update_root = true,    -- change tree root to match current file's project
  },

  git = {
    enable = true,         -- show git status icons next to files
    ignore = true,         -- hide files listed in .gitignore
    timeout = 500,
  },

  renderer = {
    root_folder_label = ":t",  -- show only the folder name, not the full path
    indent_markers = {
      enable = true,           -- show indent guide lines in the tree
    },
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open   = "",
          arrow_closed = "",
          default      = "",
          open         = "",
          empty        = "",
          empty_open   = "",
          symlink      = "",
          symlink_open = "",
        },
        git = {
          unstaged  = "",
          staged    = "S",
          unmerged  = "",
          renamed   = "➜",
          untracked = "U",
          deleted   = "",
          ignored   = "◌",
        },
      },
    },
  },

  diagnostics = {
    enable = false,        -- disabled: sign conflict with LSP gutter diagnostics
  },

  view = {
    width = 30,            -- sidebar width in columns
    side = "left",
    number = false,
    relativenumber = false,
  },

  -- custom key mappings inside the tree
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local map = function(key, action, desc)
      vim.keymap.set("n", key, action, { buffer = bufnr, silent = true, desc = desc })
    end

    api.config.mappings.default_on_attach(bufnr) -- keep all defaults
    map("l",   api.node.open.edit,          "Open")
    map("h",   api.node.navigate.parent_close, "Close node")
    map("v",   api.node.open.vertical,      "Open in vertical split")
  end,
})
