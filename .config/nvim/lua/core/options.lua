local opt = vim.opt
local cmd = vim.cmd

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true

-- 空格和tab
opt.list = true
opt.listchars = {
    tab = "-->",
    space = "·",
    trail = "·",
    nbsp = "␣",
}

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
cmd[[colorscheme tokyonight-storm]] -- 第三方：tokyonight.nvim

-- 折叠(第三方：treesitter.nvim)
local wo = vim.wo

wo.foldmethod = 'expr'
wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
wo.foldlevel = 5  -- 默认第5层开始折叠，你可像StackOverflow的老哥调成99
