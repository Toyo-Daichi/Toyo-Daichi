-- Neovim bundles only c, lua, vim, vimdoc, query and markdown parsers.
-- Install the rest here (needs the tree-sitter CLI). No-op if already installed.
require('nvim-treesitter').install({
  'bash',
  'go',
  'hcl',
  'javascript',
  'json',
  'python',
  'rust',
  'terraform',
  'tsx',
  'typescript',
  'yaml',
})

-- Highlighting itself is provided by Neovim. Filetypes without a parser are skipped.
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
