local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup({
  options = {
    numbers = "none",
    close_command       = "Bdelete! %d",   -- close buffer via bufferline click
    right_mouse_command = "Bdelete! %d",   -- right-click closes buffer
    left_mouse_command  = "buffer %d",     -- left-click switches to buffer
    indicator = {
      style = "icon",
      icon  = "│",                         -- active buffer indicator
    },
    buffer_close_icon    = "",
    modified_icon        = "●",            -- shown when buffer has unsaved changes
    close_icon           = "",
    left_trunc_marker    = "",
    right_trunc_marker   = "",
    max_name_length      = 30,
    max_prefix_length    = 30,
    tab_size             = 21,
    diagnostics          = "nvim_lsp",     -- show LSP error count on buffer tabs
    diagnostics_update_in_insert = false,
    offsets = {
      {
        filetype = "NvimTree",             -- make room for the file explorer sidebar
        text = "",
        padding = 1,
      },
    },
    show_buffer_icons       = true,
    show_buffer_close_icons = true,
    show_close_icon         = true,
    show_tab_indicators     = true,
    separator_style         = "thin",
    always_show_bufferline  = true,
  },
})
