vim.g.mapleader  = ' '

vim.o.number = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.hlsearch = true
vim.o.mouse = ''

-- pane config
vim.api.nvim_set_keymap(
  'n', '<leader>-', '<C-w>s', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>\\', '<C-w>v', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>w', '<C-w>w', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>r', '<C-w><', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>l', '<C-w>>', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>u', '<C-w>+', { noremap = true }
)
vim.api.nvim_set_keymap(
  'n', '<leader>b', '<C-w>-', { noremap = true }
)
