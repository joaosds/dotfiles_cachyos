local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup({
  plugins = {
    marks     = true,
    registers = true,
    spelling  = { enabled = true, suggestions = 20 },
    presets   = {
      operators    = false,
      motions      = false,
      text_objects = false,
      windows      = true,
      z            = true,
      g            = true,
    },
  },
  icons = {
    breadcrumb = "»",
    separator  = "➜",
    group      = "+",
  },
  win = {                  -- replaces deprecated `window`
    border  = "rounded",
    padding = { 2, 2, 2, 2 },
  },
  layout = {
    align = "center",
  },
  show_help = false,
})

-- new which-key v3 spec format
which_key.add({
  { "<leader>a",  "<cmd>Alpha<CR>",      desc = "Dashboard" },
  { "<leader>c",  "<cmd>Bdelete!<CR>",   desc = "Close Buffer" },
  { "<leader>e",  "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
  { "<leader>h",  "<cmd>nohlsearch<CR>", desc = "Clear Highlights" },
  { "<leader>w",  "<cmd>w<CR>",          desc = "Save" },

  -- Find
  { "<leader>f",  group = "Find" },
  { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Files" },
  { "<leader>ft", "<cmd>Telescope live_grep<CR>",   desc = "Text" },
  { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Buffers" },
  { "<leader>fr", "<cmd>Telescope oldfiles<CR>",    desc = "Recent" },
  { "<leader>fk", "<cmd>Telescope keymaps<CR>",     desc = "Keymaps" },
  { "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "Help" },

  -- LSP
  { "<leader>l",  group = "LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>",             desc = "Code Action" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",  desc = "Format" },
  { "<leader>li", "<cmd>LspInfo<CR>",                                    desc = "Info" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>",            desc = "Next Diagnostic" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>",            desc = "Prev Diagnostic" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>",                  desc = "Rename" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>",            desc = "Document Symbols" },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>",           desc = "Quickfix" },

  -- Git
  { "<leader>g",  group = "Git" },
  { "<leader>gj", "<cmd>lua require('gitsigns').next_hunk()<CR>",       desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require('gitsigns').prev_hunk()<CR>",       desc = "Prev Hunk" },
  { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<CR>",    desc = "Preview Hunk" },
  { "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<CR>",      desc = "Reset Hunk" },
  { "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<CR>",      desc = "Stage Hunk" },
  { "<leader>gb", "<cmd>Telescope git_branches<CR>",                    desc = "Branches" },
  { "<leader>gc", "<cmd>Telescope git_commits<CR>",                     desc = "Commits" },
  { "<leader>go", "<cmd>Telescope git_status<CR>",                      desc = "Status" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>",                    desc = "Diff" },

  -- Debug
  { "<leader>d",  group = "Debug" },
  { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>",    desc = "Breakpoint" },
  { "<leader>dc", "<cmd>lua require('dap').continue()<CR>",             desc = "Continue" },
  { "<leader>di", "<cmd>lua require('dap').step_into()<CR>",            desc = "Step Into" },
  { "<leader>do", "<cmd>lua require('dap').step_over()<CR>",            desc = "Step Over" },
  { "<leader>dO", "<cmd>lua require('dap').step_out()<CR>",             desc = "Step Out" },
  { "<leader>dr", "<cmd>lua require('dap').repl.toggle()<CR>",          desc = "REPL" },
  { "<leader>du", "<cmd>lua require('dapui').toggle()<CR>",             desc = "UI" },
  { "<leader>dt", "<cmd>lua require('dap').terminate()<CR>",            desc = "Terminate" },

  -- Terminal
  { "<leader>t",  group = "Terminal" },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>",                      desc = "Python REPL" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",                desc = "Float" },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>",   desc = "Horizontal" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<CR>",     desc = "Vertical" },

  -- Split
  { "<leader>s",  group = "Split" },
  { "<leader>ss", "<cmd>split<CR>",  desc = "Horizontal" },
  { "<leader>sv", "<cmd>vsplit<CR>", desc = "Vertical" },
})
