return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Mason：用于安装 LSP 服务器、DAP、Linter 等
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "lua_ls",
        "ts_ls",
        "pyright",
        "rust_analyzer",
        "jsonls",
        "yamlls",
      },
      automatic_installation = true,
      -- automatic_enable 默认开启，会自动对所有已安装的 LSP server 调用 vim.lsp.enable()
    })

    -- 基于 Neovim 0.11+ 的 vim.lsp.config API
    -- 全局 on_attach / capabilities 会应用于所有 LSP 服务器
    vim.lsp.config["*"] = {
      on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)         -- 跳转到定义
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)     -- 跳转到实现
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)              -- 悬停显示文档
        vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, bufopts)    -- 重命名
        vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts) -- 代码操作
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)        -- 查找引用
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)      -- 上一个诊断
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)      -- 下一个诊断
        vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, bufopts) -- 查看诊断详情
      end,
      capabilities = (function()
        local caps = vim.lsp.protocol.make_client_capabilities()
        local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        if ok then
          caps = cmp_lsp.default_capabilities(caps)
        end
        return caps
      end)(),
    }
  end,
}
