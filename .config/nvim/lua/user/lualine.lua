local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",                                    -- follows your colorscheme automatically
    component_separators = { left = "", right = "" },
    section_separators   = { left = "", right = "" },
    disabled_filetypes   = { "alpha", "NvimTree" },    -- hide statusline on dashboard and file explorer
    globalstatus = true,                               -- single statusline for all splits
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },  -- git branch, changes, LSP errors/warnings
    lualine_c = { { "filename", path = 1 } },          -- show relative path, not just filename
    lualine_x = { "filetype" },
    lualine_y = { "progress" },                        -- percentage through file
    lualine_z = { "location" },                        -- line:column
  },
  inactive_sections = {
    lualine_c = { "filename" },
    lualine_x = { "location" },
  },
})
