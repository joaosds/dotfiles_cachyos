local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

ibl.setup({
  indent = {
    char = "▏",  -- thin indent guide character
  },
  scope = {
    enabled = true,  -- highlight the current code block (function, if, for, etc.)
  },
  exclude = {
    filetypes = { "help", "alpha", "NvimTree", "lazy" },
    buftypes  = { "terminal", "nofile" },
  },
})
