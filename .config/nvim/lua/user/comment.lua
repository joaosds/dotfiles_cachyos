local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup()

-- Default keybindings (no config needed):
-- NORMAL MODE
--   gcc        toggle current line
--   gbc        toggle current line (blockwise)
--   gc{motion} toggle lines covered by motion  e.g. gc3j
-- VISUAL MODE
--   gc         toggle selected lines
--   gb         toggle selected block
-- INSERT MODE
--   gco        add comment on next line
--   gcO        add comment on previous line
--   gcA        add comment at end of current line
