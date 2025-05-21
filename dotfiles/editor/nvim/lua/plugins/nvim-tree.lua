return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require('config.nvim-tree')
  end,
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
    }
  },
}
