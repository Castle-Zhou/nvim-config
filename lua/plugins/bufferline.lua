return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      highlights = require("catppuccin.special.bufferline").get_theme(),
      options = {
        always_show_bufferline = true,
        show_close_icon = false,
        custom_filter = function(buf_id, _)
          return vim.fn.bufname(buf_id) ~= ""
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    })
  end,
}
