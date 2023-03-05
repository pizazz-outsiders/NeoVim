-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "git@github.com:wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup({
  function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- 主题
    use {
      'ellisonleao/gruvbox.nvim',
      requires = 'rktjmp/lush.nvim'
    }

    -- 文件浏览器
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
    }

    -- 顶部标签页
    use {
      'akinsho/bufferline.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        'moll/vim-bbye'
      },
    }
    -- 底部信息显示栏
    use {
      'nvim-lualine/lualine.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
    }
    use 'arkav/lualine-lsp-progress'

    -- 模糊查询工具
    use {
      'nvim-telescope/telescope.nvim',
      requires = 'nvim-lua/plenary.nvim'
    }

    -- 括号自动补全
    use 'jiangmiao/auto-pairs'

    -- 增强代码高亮
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    --------------------- LSP --------------------
    -- installer
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }

    -- Snippet 引擎
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

    -- UI 增强
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")

    -- Lua 增强
    use("folke/neodev.nvim")

  end,
  config = {
    max_jobs = 10,
    git = {
      default_url_format = "git@github.com:%s"
    },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end
    }
  }
})
