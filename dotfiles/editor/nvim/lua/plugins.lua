vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'
  
  -- IDE
  --use {
  --  'neoclide/coc.nvim', branch='release'
  --}

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  -- GitHub Copilot
  use {
    'github/copilot.vim'
  }

  -- Directory Show
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }

  -- File search 
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- File history search
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- Status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  --- Tab bar
  --use {
  --  'romgrk/barbar.nvim'
  --}

  -- Syntax config
  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  }

  --- Diff view
  use 'sindrets/diffview.nvim'

  -- History manager
  use {
    'mbbill/undotree'
  }

  -- Color Scheme
  use {
    "EdenEast/nightfox.nvim"
  }

end)

