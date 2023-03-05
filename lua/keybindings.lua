local uConfig = require("uConfig")
local keys = uConfig.keys

local map = vim.api.nvim_set_keymap

local opt = {
  noremap = true,
  silent = true,
}

-- leader key 为空格
--vim.g.mapleader = keys.leader_key
--vim.g.maplocalleader = keys.leader_key
local opts_remap = {
  remap = true,
  silent = true,
}

local opts_expr = {
  expr = true,
  silent = true,
}

-- 插件快捷键
local pluginKeys = {}

local lsp = uConfig.lsp
pluginKeys.mapLSP = function(mapbuf)
  mapbuf("n", lsp.rename, "<cmd>lua vim.lsp.buf.rename()<CR>")
  mapbuf("n", lsp.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>")
  mapbuf("n", lsp.definition, function()
    require("telescope.builtin").lsp_definitions({
      initial_mode = "normal",
      -- ignore_filename = false,
    })
  end)
  mapbuf("n", lsp.hover, "<cmd>lua vim.lsp.buf.hover()<CR>")
  mapbuf(
    "n",
    lsp.references,
    "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy())<CR>"
  )

  if vim.fn.has("nvim-0.8") == 1 then
    mapbuf("n", lsp.format, "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
  else
    mapbuf("n", lsp.format, "<cmd>lua vim.lsp.buf.formatting()<CR>")
  end

  mapbuf("n", lsp.open_flow, "<cmd>lua vim.diagnostic.open_float()<CR>")
  mapbuf("n", lsp.goto_next, "<cmd>lua vim.diagnostic.goto_next()<CR>")
  mapbuf("n", lsp.goto_prev, "<cmd>lua vim.diagnostic.goto_prev()<CR>")

end


local plugin = uConfig.plugin

-- nvim-tree
local nvimTree = plugin.NvimTree
-- alt + m 键打开关闭tree
map("n", nvimTree.NvimTreeToggle, ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
  { 
    key = nvimTree.edit, 
    action = "edit" 
  },
  -- 分屏打开文件
  { 
    key = nvimTree.vsplit, 
    action = "vsplit" 
  },
  { 
    key = nvimTree.split, 
    action = "split" 
  },
  -- 显示隐藏文件
  { 
    key = nvimTree.toggle_custom, 
    action = "toggle_custom" 
  },
  { 
    key = nvimTree.toggle_dotfiles, 
    action = "toggle_dotfiles" 
  }, 
  -- 文件操作
  { key = nvimTree.refresh, action = "refresh" },
  { key = nvimTree.create, action = "create" },
  { key = nvimTree.remove, action = "remove" },
  { key = nvimTree.rename, action = "rename" },
  { key = nvimTree.cut, action = "cut" },
  { key = nvimTree.copy, action = "copy" },
  { key = nvimTree.paste, action = "paste" },
}

-- Telescope
local Telescope = plugin.Telescope
-- 查找文件
map("n", Telescope.find_files, ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", Telescope.live_grep, ":Telescope live_grep<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
     -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  }
}

return pluginKeys
