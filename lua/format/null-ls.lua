local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    -- bash
    formatting.shfmt,
    -- StyLua
    formatting.stylua,
    formatting.prettier.with({
      filetypes = {
        "json",
        "yaml",
        "markdown",
      },
      timeout = 10000,
      prefer_local = "node_modules/.bin",
    }),
    -- Python
    formatting.black.with({ extra_args = { "--fast" } }),
  },
  diagnostics_format = "[#{s}] #{m}",
  on_attach = function(_)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
    -- if client.resolved_capabilities.document_formatting then
    --   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    -- end
  end,
})
