return {
  {
    "neovim/nvim-lspconfig"
  },
  {
    "mason-org/mason.nvim",
    version = "^1.0.0"
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim"
    },
    config = function()
      require('config.lsp')
    end,
  },
}
