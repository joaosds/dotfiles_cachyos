return {
  texlab = {
    build = {
      executable = "latexmk",
      args       = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
      onSave     = true,           -- compile on every save
      forwardSearchAfter = true,   -- open PDF after successful build
    },
    forwardSearch = {
      executable = "zathura",      -- PDF viewer with synctex support
      args       = { "--synctex-forward", "%l:1:%f", "%p" },
    },
    chktex = {
      onEdit          = false,     -- don't run chktex while typing (too noisy)
      onOpenAndSave   = true,      -- run chktex on open and save
    },
    latexFormatter    = "latexindent",
    formatterLineLength = 80,
  },
}
