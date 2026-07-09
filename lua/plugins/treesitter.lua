return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "python",
        "rust",
        "go",
        "c",
        "cpp",
        "html",
        "css",
        "json",
        "yaml",
        "toml",
        "markdown",
        "bash",
        "sql",
        "gitignore",
        "diff",
      },
    })
  end,
}
