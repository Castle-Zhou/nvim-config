return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    defaults = {},
    spec = {
      { "<Leader>f", group = "Find",       icon = "" },
      { "<Leader>b", group = "Buffer",     icon = "" },
      { "<Leader>c", group = "Code",       icon = "" },
      { "<Leader>h", group = "Hunk",       icon = "" },
      { "<Leader>u", group = "UI/Toggle",  icon = "" },
      { "<Leader>g", group = "Git",        icon = "" },
      { "<Leader>l", group = "LSP",        icon = "" },
      { "<Leader>d", group = "Diagnostic", icon = "" },
      { "[", group = "Prev",               icon = "" },
      { "]", group = "Next",               icon = "" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
