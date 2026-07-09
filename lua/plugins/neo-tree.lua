return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<Leader>e", "<Cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          -- l: 展开目录或打开文件; h: 折叠目录/返回父节点
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
