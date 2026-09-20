return {
  'milanglacier/minuet-ai.nvim',
  lazy = true,
  config = function()
    require('config.minuet')
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
