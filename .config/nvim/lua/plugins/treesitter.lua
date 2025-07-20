require('nvim-treesitter.configs').setup {
  -- 确保安装的组件
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "verilog", "json", "xml"},
  -- 忽略安装的组件
  ignore_install = { },
  -- 组件安装模式配置
  sync_install = false,
  auto_install = true,
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  -- 高亮显示模式
  highlight = {
    -- 启用规则
    enable = true,
    -- 禁用规则
    --disable = { "c", "rust" },
    --disable = function(lang, buf)
    --    local max_filesize = 100 * 1024 -- 100 KB
    --    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --    if ok and stats and stats.size > max_filesize then
    --        return true
    --    end
    --end,
    -- 语法突出显示
    additional_vim_regex_highlighting = false,
  },

  -- 缩排(实验)
  indent = { enable = true },

  -- 增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>", -- set to `false` to disable one of the mappings
      node_incremental = "<TAB>",
      scope_incremental = "<CR>",
      node_decremental = "<S-TAB>",
    },
  },

}

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    -- 仅当文件有折叠功能时再做展开，避免无折叠文件报错
    if vim.fn.exists('##foldlevelstart') == 1 then
      vim.cmd('normal! zR')
    end
  end,
})
