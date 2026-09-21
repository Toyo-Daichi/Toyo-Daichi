require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    },
    layout_strategy = 'vertical',
    layout_config = {},
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ['<C-u>'] = false
      },
    },
    winblend = 10,
  },
})

require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- git_files errors outside a git repo, so fall back to find_files there
vim.keymap.set('n', '<C-p>', function()
  local ok = pcall(builtin.git_files, { show_untracked = true })
  if not ok then
    builtin.find_files()
  end
end, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
