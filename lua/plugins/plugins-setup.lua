-- 自动安装packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 
      'clone', 
      '--depth', 
      '1', 
      -- 'https://github.com/wbthomason/packer.nvim',
      'https://gitclone.com/github.com/wbthomason/packer.nvim', 
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local packer = require('packer')

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim' -- 主题
    use {
      'nvim-lualine/lualine.nvim',  -- 状态栏
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }  -- 状态栏图标
    }
    use {
      'nvim-tree/nvim-tree.lua',  -- 文档树
      requires = {
        'nvim-tree/nvim-web-devicons', -- 文档树图标
      }
    }
    use 'christoomey/vim-tmux-navigator' -- 用ctl-hjkl来定位窗口
    use 'nvim-treesitter/nvim-treesitter' -- 语法高亮
    use 'p00f/nvim-ts-rainbow' -- 配合treesitter，不同括号颜色区分
    use {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',  -- 这个相当于mason.nvim和lspconfig的桥梁
      'neovim/nvim-lspconfig'
    }
    use {
      'ray-x/go.nvim',
      'ray-x/guihua.lua'
    }
      -- 自动补全
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip' -- snippets引擎，不装这个自动补全会出问题
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    use 'hrsh7th/cmp-path' -- 文件路径

    use 'numToStr/Comment.nvim' -- gcc和gc注释
    use 'windwp/nvim-autopairs' -- 自动补全括号

    use 'akinsho/bufferline.nvim' -- buffer分割线
    use 'lewis6991/gitsigns.nvim' -- 左则git提示

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    if packer_bootstrap then
      packer.sync()
    end
  end,
  config = {
    -- 最大并发数
    max_jobs = 16,
    -- 自定义源
    git = {
        default_url_format = 'https://gitclone.com/github.com/%s',
        -- default_url_format = 'https://github.com.cnpmjs.org/%s',
        -- default_url_format = 'https://gitcode.net/mirrors/%s',
        -- default_url_format = 'https://hub.fastgit.org/%s',
        -- default_url_format = 'https://mirror.ghproxy.com/https://github.com/%s',
    }
    -- display = {
    -- 使用浮动窗口显示
    --   open_fn = function()
    --     return require('packer.util').float({ border = 'single' })
    --   end,
    -- },
  }
})
