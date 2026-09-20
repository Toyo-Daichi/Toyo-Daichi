return {
    'nvim-telescope/telescope.nvim', 
    version = '*',
    config = function()
      require('config.telescope')
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
}
