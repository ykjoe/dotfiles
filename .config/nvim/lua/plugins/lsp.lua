require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

-- 打开行内虚拟文本,以显示错误信息
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
  fg = "#ff0000",
  bg = "#363636",
  italic = true,
  undercurl = true,
})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {
  fg = "#ff8800",
  bg = "#363636",
  italic = true,
  undercurl = true,
})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", {
  fg = "#00aaff",
  bg = "#363636",
  italic = true,
  undercurl = true,
})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", {
  fg = "#aaaaaa",
  bg = "#363636",
  italic = true,
  undercurl = true,
})
