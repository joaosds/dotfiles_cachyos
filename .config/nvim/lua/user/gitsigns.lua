local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup({
  signs = {
    add          = { text = "▎" },  -- new lines added
    change       = { text = "▎" },  -- modified lines
    delete       = { text = "" },  -- deleted lines
    topdelete    = { text = "" },  -- deleted at top of block
    changedelete = { text = "▎" },  -- modified then deleted
  },

  signcolumn = true,   -- show signs in the gutter
  numhl      = false,  -- don't highlight line numbers
  linehl     = false,  -- don't highlight the full line

  current_line_blame = false,  -- toggle inline git blame with :Gitsigns toggle_current_line_blame
  current_line_blame_opts = {
    virt_text     = true,
    virt_text_pos = "eol",   -- show blame at end of line
    delay         = 1000,
  },

  watch_gitdir = {
    interval     = 1000,
    follow_files = true,     -- track file renames in git
  },

  attach_to_untracked = true,
  update_debounce     = 100,
  max_file_length     = 40000,

  preview_config = {
    border   = "rounded",
    style    = "minimal",
    relative = "cursor",
    row      = 0,
    col      = 1,
  },
})
