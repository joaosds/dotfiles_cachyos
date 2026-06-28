local colorscheme = "kanagawa"
-- local colorscheme = "tokyonight"
-- local colorscheme = "vim-code-dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
end
