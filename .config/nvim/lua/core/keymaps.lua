vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "<C-L>", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>wv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>wh", "<C-w>s") -- 垂直新增窗口
keymap.set("n", "<leader>wc", "<C-w>c") -- 关闭当前窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")


-- ---------- 插件配置 ---------- ---
-- nvim-tree
keymap.set("n", "<C-p>", ":NvimTreeToggle<CR>")

-- bufferline
keymap.set("n", "<S-L>", ":bnext<CR>")
keymap.set("n", "<S-H>", ":bprevious<CR>")
keymap.set("n", "<S-Q>", ":bd<CR>")

-- treessiter
-- Function for "folding"
keymap.set('n', '<TAB>', 'zo')
keymap.set('n', '<S-TAB>', 'zc')

local MAX_LINES = 114514-- 最大检索行数，防止大文件卡死
local function has_any_folded()
  -- 判断是否有折叠的行
  local last = math.min(vim.fn.line('$'), MAX_LINES)
  for lnum = 1, last do
    if vim.fn.foldclosed(lnum) ~= -1 then
      return true
    end
  end
  return false
end
local function toggle_all_fold()
  -- 折叠功能设置
  if has_any_folded() then
    vim.cmd('normal! zR')   -- 有折叠 -> 全部展开
  else
    vim.cmd('normal! zM')   -- 无折叠 -> 全部折叠
  end
end

vim.keymap.set('n', '<Leader><TAB>', toggle_all_fold, { silent = true })

