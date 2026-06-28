local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = "  ",            -- search icon in prompt
    selection_caret = " ",           -- arrow for selected item
    path_display = { "smart" },      -- shorten paths intelligently
    file_ignore_patterns = {         -- never show these in results
      ".git/",
      "node_modules/",
    },

    mappings = {
      -- insert mode bindings (while typing the search)
      i = {
        ["<C-n>"] = actions.cycle_history_next,      -- cycle through search history
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,     -- move down in results
        ["<C-k>"] = actions.move_selection_previous, -- move up in results
        ["<C-c>"] = actions.close,
        ["<CR>"]  = actions.select_default,          -- open selected file
        ["<C-s>"] = actions.select_horizontal,       -- open in horizontal split
        ["<C-v>"] = actions.select_vertical,         -- open in vertical split
        ["<C-d>"] = actions.delete_buffer,           -- delete buffer from list
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- send all to quickfix
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      },

      -- normal mode bindings (after pressing Esc in telescope)
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"]  = actions.select_default,
        ["<C-v>"] = actions.select_vertical,
        ["<C-s>"] = actions.select_horizontal,
        ["j"]     = actions.move_selection_next,
        ["k"]     = actions.move_selection_previous,
        ["gg"]    = actions.move_to_top,
        ["G"]     = actions.move_to_bottom,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["?"]     = actions.which_key,               -- show all telescope keymaps
      },
    },
  },
})
