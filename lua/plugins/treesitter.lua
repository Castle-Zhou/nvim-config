return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    highlight = { enable = true },
    ensure_installed = {
      "javascript",
      "typescript",
      "tsx",
      "jsdoc",
      "lua",
      "vim",
      "vimdoc",
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
    },
  },
  config = function(_, opts)
    -- 1) 将 parser 下载 URL 替换为 ghproxy 镜像（中国大陆友好）
    local parsers = require("nvim-treesitter.parsers")
    for _, info in pairs(parsers) do
      if info.install_info and info.install_info.url then
        info.install_info.url = info.install_info.url:gsub(
          "^https://github%.com/",
          "https://ghproxy.net/https://github.com/"
        )
      end
    end

    -- 2) 初始化 treesitter
    require("nvim-treesitter").setup(opts)

    -- 3) 自动安装缺失的 parser
    local installed = require("nvim-treesitter.config").get_installed()
    local missing = vim.iter(opts.ensure_installed)
      :filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end)
      :totable()

    if #missing > 0 then
      if vim.fn.executable("tree-sitter") == 0 then
        vim.schedule(function()
          vim.notify(
            "Treesitter: 需要 tree-sitter CLI 来编译 parser。"
              .. " 请执行: brew install tree-sitter-cli",
            vim.log.levels.WARN
          )
        end)
      else
        vim.schedule(function()
          require("nvim-treesitter").install(missing, { summary = true })
        end)
      end
    end
  end,
}
