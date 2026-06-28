local options = {
  backup = false,                      -- don't create backup files
  clipboard = "unnamedplus",           -- use system clipboard for yank/paste
  cmdheight = 1,                       -- height of the command line
  completeopt = { "menuone", "noselect" }, -- cmp completion behavior
  conceallevel = 0,                    -- show markdown/latex syntax as-is by default (vimtex overrides this)
  fileencoding = "utf-8",              -- file encoding
  hlsearch = false,                    -- don't keep search results highlighted
  ignorecase = true,                   -- case-insensitive search
  smartcase = true,                    -- override ignorecase if search has uppercase
  mouse = "a",                         -- enable mouse in all modes
  pumheight = 10,                      -- max items in completion popup
  showmode = false,                    -- hide -- INSERT -- (lualine shows it instead)
  showtabline = 2,                     -- always show the tabline
  smartindent = true,                  -- auto-indent new lines
  splitbelow = true,                   -- horizontal splits open below
  splitright = true,                   -- vertical splits open to the right
  swapfile = false,                    -- no swapfiles
  termguicolors = true,                -- enable 24-bit color
  timeoutlen = 1000,                   -- ms to wait for mapped key sequence
  undofile = true,                     -- persistent undo across sessions
  updatetime = 300,                    -- faster cursor hold events (used by gitsigns, illuminate)
  writebackup = false,                 -- no backup before overwriting
  expandtab = true,                    -- convert tabs to spaces
  shiftwidth = 2,                      -- spaces per indent level
  tabstop = 2,                         -- spaces per tab character
  cursorline = true,                   -- highlight the current line
  number = true,                       -- show absolute line numbers
  relativenumber = true,               -- show relative line numbers (useful for jumps)
  numberwidth = 4,                     -- width of the line number column
  signcolumn = "yes",                  -- always show sign column (prevents layout shift)
  wrap = false,                        -- don't wrap long lines
  scrolloff = 8,                       -- keep 8 lines visible above/below cursor
  sidescrolloff = 8,                   -- keep 8 columns visible left/right of cursor
  laststatus = 3,                      -- single global statusline
  colorcolumn = "80",                  -- vertical ruler at 80 chars
  spell = true,                        -- enable spellcheck
  spelllang = { "en" },                -- spellcheck in English
}

vim.opt.fillchars.eob = " "           -- hide ~ on empty lines after buffer ends

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l") -- allow h/l to move across line boundaries
vim.cmd([[set iskeyword+=-]])          -- treat dash-separated words as one word
