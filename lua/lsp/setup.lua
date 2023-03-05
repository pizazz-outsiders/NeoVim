local status, mason = pcall(require, "mason")
if not status then
  vim.notify("没有找到 mason")
  return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到 lspconfig")
  return
end

-- :h mason-default-settings
-- ~/.local/share/nvim/mason
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_config.setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "clangd",
    "cmake",
    "jsonls",
    "bashls"
  }
})

local servers = {
  -- lua
  lua_ls = require("lsp.config.lua"),
  pyright = require("lsp.config.pyright"),
  clangd = require("lsp.config.clangd"),
  cmake = require("lsp.config.cmake"),
  jsonls = require("lsp.config.jsonls"),
  bashls = require("lsp.config.bashls")
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end

require("lsp.ui")
