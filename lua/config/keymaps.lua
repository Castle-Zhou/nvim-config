-- 快捷键映射

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 将 <Leader> 从等待模式中解放出来
map("n", "<Space>", "", opts)

-- 窗口导航（用 Ctrl + hjkl 在分屏间移动）
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- 窗口大小调整（用方向键调整）
map("n", "<M-up>", "<CMD>resize +2<CR>", opts)
map("n", "<M-down>", "<CMD>resize -2<CR>", opts)
map("n", "<M-left>", "<CMD>vertical resize -2<CR>", opts)
map("n", "<M-right>", "<CMD>vertical resize +2<CR>", opts)

-- 更好的页面滚动（保持光标居中）
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- 高亮搜索取消（按 Esc 取消高亮）
map("n", "<Esc>", "<CMD>nohlsearch<CR><Esc>", opts)

-- 在 Normal 模式下移动当前行（⌥J / ⌥K Mac 兼容）
map("n", "∆", ":m .+1<CR>==", opts)
map("n", "˚", ":m .-2<CR>==", opts)
map("n", "<M-j>", ":m .+1<CR>==", opts)
map("n", "<M-k>", ":m .-2<CR>==", opts)

-- 在可视模式下移动文本块（⌥J / ⌥K Mac 兼容）
map("v", "∆", ":m '>+1<CR>gv=gv", opts)
map("v", "˚", ":m '<-2<CR>gv=gv", opts)
map("v", "<M-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<M-k>", ":m '<-2<CR>gv=gv", opts)

-- 切换亮/暗背景
map("n", "<Leader>ub", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end, { desc = "Toggle light/dark background" })

-- 更好的命令行导航
map("c", "<C-a>", "<Home>", opts)
map("c", "<C-e>", "<End>", opts)
map("c", "<C-b>", "<Left>", opts)
map("c", "<C-f>", "<Right>", opts)

-- wrap 行的光标移动
map("n", "k", "gk", opts)
map("n", "j", "gj", opts)

-- 黑洞 x, r
map("n", "x", "\"_x", opts)
map("n", "r", "\"_r", opts)

-- buffer 相关
map("n", "<Leader>bd", "<CMD>bdelete<CR>", opts)
map("n", "H", "<CMD>bprev<CR>", opts)
map("n", "L", "<CMD>bnext<CR>", opts)

