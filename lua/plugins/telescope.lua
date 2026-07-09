return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  init = function()
    -- nvim-treesitter.parsers 新版无 get_parser，telescope 仍依赖它
    -- telescope 兼容 nvim-treesitter main 分支的 API 变化
    do
      -- parsers
      local ok_p, parsers = pcall(require, "nvim-treesitter.parsers")
      if ok_p and type(parsers) == "table" then
        if not parsers.get_parser then
          parsers.get_parser = vim.treesitter.get_parser
        end
        if not parsers.ft_to_lang then
          parsers.ft_to_lang = function(ft)
            local ok, lang = pcall(vim.treesitter.language.get_lang, ft)
            if ok and lang then return lang end
            return ft
          end
        end
      end

      -- configs（main 分支已移除，提供空桩让 telescope 不报错）
      local ok_c, _ = pcall(require, "nvim-treesitter.configs")
      if not ok_c then
        package.preload["nvim-treesitter.configs"] = function()
          return {
            is_enabled = function()
              return true
            end,
            get_module = function(name)
              if name == "highlight" then
                return { additional_vim_regex_highlighting = {} }
              end
              return {}
            end,
          }
        end
      end
    end
  end,
  cmd = "Telescope",
  keys = {
    { "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<Leader><Leader>", "<Cmd>Telescope find_files<CR>", desc = "Find files"},
    { "<Leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<Leader>/", "<Cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<Leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Find buffers" },
    { "<Leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Help tags" },
    { "<Leader>fs", "<Cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    pcall(require("telescope").load_extension, "fzf")
  end,
}
