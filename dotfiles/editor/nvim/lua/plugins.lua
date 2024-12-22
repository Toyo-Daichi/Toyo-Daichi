vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Plugin manager
  use {
    'wbthomason/packer.nvim'
  }

  -- Icon
  use {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim'
  }

  -- IDE
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use {
    'nvimtools/none-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvimdev/lspsaga.nvim',
    requires = { 'neovim/nvim-lspconfig' }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  }

  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'j-hui/fidget.nvim',
    config = function()
      require 'plugins.fidget'
    end,
    requires = { 'neovim/nvim-lspconfig' }
  }

  use {
    'mbbill/undotree',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'lukas-reineke/indent-blankline.nvim'
  }

  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    }
  }

  use {
    'lewis6991/gitsigns.nvim'
  }

  -- File
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = {{ 'nvim-lua/plenary.nvim' }}
  }

  use {
      'ThePrimeagen/harpoon',
      branch = 'harpoon2',
      requires = { 'nvim-lua/plenary.nvim' }
  }


  -- Color Scheme
  use {
    'EdenEast/nightfox.nvim'
  }


end)
