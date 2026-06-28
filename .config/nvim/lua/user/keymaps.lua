local keymap = vim.keymap.set
local opts = { silent = true }

-- Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- ── Window navigation ─────────────────────────────────────────────────────
keymap("n", "<C-h>", "<C-w>h", opts)  -- move to left window
keymap("n", "<C-j>", "<C-w>j", opts)  -- move to window below
keymap("n", "<C-k>", "<C-w>k", opts)  -- move to window above
keymap("n", "<C-l>", "<C-w>l", opts)  -- move to right window

-- ── Resize windows with arrows ────────────────────────────────────────────
keymap("n", "<C-Up>",    ":resize -2<CR>",          opts)
keymap("n", "<C-Down>",  ":resize +2<CR>",          opts)
keymap("n", "<C-Left>",  ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- ── Buffer navigation ─────────────────────────────────────────────────────
keymap("n", "<S-l>", ":bnext<CR>",             opts)  -- next buffer
keymap("n", "<S-h>", ":bprevious<CR>",         opts)  -- previous buffer
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>",      opts)  -- close buffer without closing window

-- ── Search ────────────────────────────────────────────────────────────────
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)  -- clear search highlights

-- ── Editing ───────────────────────────────────────────────────────────────
keymap("v", "p", '"_dP',  opts)   -- paste without overwriting the register
keymap("v", "<", "<gv",   opts)   -- stay in visual mode after indent left
keymap("v", ">", ">gv",   opts)   -- stay in visual mode after indent right
keymap("i", "jk", "<ESC>", opts)  -- quick escape from insert mode

-- ── File explorer ─────────────────────────────────────────────────────────
keymap("n", "<C-n>",      ":NvimTreeToggle<CR>",   opts)  -- toggle sidebar
keymap("n", "<leader>n",  ":NvimTreeFindFile<CR>", opts)  -- reveal current file in sidebar

-- ── Telescope ─────────────────────────────────────────────────────────────
keymap("n", "<leader>ff", ":Telescope find_files<CR>",  opts)  -- search files
keymap("n", "<leader>ft", ":Telescope live_grep<CR>",   opts)  -- search text in project
keymap("n", "<leader>fb", ":Telescope buffers<CR>",     opts)  -- list open buffers
keymap("n", "<leader>fk", ":Telescope keymaps<CR>",     opts)  -- search keymaps

-- ── Terminal ──────────────────────────────────────────────────────────────
-- toggleterm keymaps are set in toggleterm.lua

-- ── Python ────────────────────────────────────────────────────────────────
keymap("n", "<F5>", "<Esc>:w<CR>:!clear;python %<CR>", opts)  -- save and run current Python file

-- ── Spellcheck ────────────────────────────────────────────────────────────
keymap("n", "<F11>", ":set spell!<CR>", opts)  -- toggle spellcheck

-- ── DAP (Python debugger) ─────────────────────────────────────────────────
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>",          opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>",         opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>",         opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<CR>",          opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>",       opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>",          opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<CR>",         opts)
