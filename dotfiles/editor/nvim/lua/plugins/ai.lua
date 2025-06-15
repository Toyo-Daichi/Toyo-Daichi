return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require('config.copilot')
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim"
    },
    config = function()
      require('config.code-companion'):init()
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons",
    },
    ft = {
      "markdown",
      "markdown.mdx",
      "Avante",
      "codecompanion"
    },
    opts = {
      file_types = {
        "markdown",
        "Avante",
        "codecompanion"
      },
    }
  }
}
