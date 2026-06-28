local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size             = 20,
  open_mapping     = [[<C-\>]],   -- toggle terminal with Ctrl+\
  hide_numbers     = true,
  start_in_insert  = true,
  insert_mappings  = true,        -- open_mapping works in insert mode too
  persist_size     = true,
  direction        = "float",     -- floating terminal window
  close_on_exit    = true,
  shell            = vim.o.shell,
  float_opts = {
    border   = "curved",
    winblend = 0,
  },
})

-- use jk to exit terminal insert mode (same as normal neovim escape)
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    local opts = { noremap = true, buffer = 0 }
    vim.keymap.set("t", "jk",    [[<C-\><C-n>]],        opts)
    vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j>]], opts)
    vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k>]], opts)
  end,
})

-- dedicated Python REPL terminal (toggle with <leader>tp)
local Terminal = require("toggleterm.terminal").Terminal

local python = Terminal:new({ cmd = "python", hidden = true })
function _PYTHON_TOGGLE()
  python:toggle()
end
vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", { silent = true, desc = "Toggle Python REPL" })
