vim.g.mapleader       = ' '

vim.o.termguicolors   = true

-- Neovim sets 'background' from the terminal's OSC 11 reply. When the reply
-- arrives late it flips 'background' to dark and drops dayfox, so turn the
-- auto-detection off (the colorscheme is fixed to dayfox anyway).
for _, au in ipairs(vim.api.nvim_get_autocmds({ event = 'TermResponse' })) do
  if au.desc and au.desc:find("'background'", 1, true) then
    vim.api.nvim_del_autocmd(au.id)
  end
end

vim.o.number          = true
vim.wo.relativenumber = true
vim.o.shiftwidth      = 2
vim.o.tabstop         = 2
vim.o.expandtab       = true
vim.o.autoindent      = true
vim.o.hlsearch        = true
vim.o.mouse           = ''
vim.o.backup          = false
vim.o.backupcopy      = 'yes'
vim.o.clipboard       = 'unnamedplus'
vim.opt.guicursor     = "n-v-c-i:hor20"
vim.api.nvim_win_set_option(0, 'cursorline', true)

-- undo tree (bundled with Neovim, loaded on demand)
vim.keymap.set('n', '<leader>/', function()
  vim.cmd.packadd('nvim.undotree')
  vim.cmd.Undotree()
end)

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
