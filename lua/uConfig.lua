local M = {
  keys = {
    leader_key = " ",
  },

  cmp = {
    -- cmp 快捷键
    cmp_complete = "<C-n>",
    cmp_abort = "<C-n>",
    cmp_confirm = "<CR>",
    cmp_scroll_doc_up = "<C-u>",
    cmp_scroll_doc_down = "<C-d>",
    cmp_select_prev_item = "<C-k>",
    cmp_select_next_item = "<C-j>",
  },

  lsp = {
    rename = "<leader>rn",
    code_action = "<leader>ca",
    format = "<leader>f",
    definition = "gd",
    references = "gr",
    hover = "gh",
    -- diagnostic
    open_flow = "gp",
    goto_next = "gj",
    goto_prev = "gk",
    -- typescript
    ts_organize = "gs",
    ts_rename_file = "gR",
    ts_add_missing_import = "gi",
    ts_remove_unused = "gu",
    ts_fix_all = "gf",
    ts_goto_source = "gD",
  },

  plugin = {
    NvimTree = {
      NvimTreeToggle = "<C-e>",
      edit = { "<CR>", "o", "<2-LeftMouse>" },
      vsplit = "v",
      split = "h",
      toggle_custom = "i",
      toggle_dotfiles = ".",
      refresh = "<F5>",
      create = "a",
      remove = "d",
      rename = "r",
      cut = "x",
      copy = "c",
      paste = "p",
    },
    Telescope = {
      find_files = "<C-p>",
      live_grep = "<C-f>",
      -- 上下移动
      move_selection_next = "<C-j>",
      move_selection_previous = "<C-k>",
      move_selection_next = "<Down>",
      move_selection_previous = "<Up>",
      -- 历史记录
      cycle_history_next = "<C-n>",
      cycle_history_prev = "<C-p>",
      -- 关闭窗口
      close = "<C-c>",
      -- 预览窗口上下滚动
      preview_scrolling_up = "<C-u>",
      preview_scrolling_down = "<C-d>",
    }
  }
}

return M
