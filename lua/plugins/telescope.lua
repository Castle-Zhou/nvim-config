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
    local ok_p, parsers = pcall(require, "nvim-treesitter.parsers")
    if ok_p and type(parsers) == "table" and not parsers.get_parser then
      parsers.get_parser = vim.treesitter.get_parser
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
