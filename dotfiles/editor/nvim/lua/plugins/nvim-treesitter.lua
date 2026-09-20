return {
  'nvim-treesitter/nvim-treesitter',
  -- this plugin does not support lazy-loading
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('config.nvim-treesitter')
  end,
}
