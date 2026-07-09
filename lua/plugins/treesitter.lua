return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()
    -- 启用 treesitter 高亮（master 分支需手动调 configs.setup）
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
    })
  end,
}
