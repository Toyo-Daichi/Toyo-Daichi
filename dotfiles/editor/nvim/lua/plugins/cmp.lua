return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = function()
    require('config.cmp')
  end,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
    'milanglacier/minuet-ai.nvim',
  },
}
