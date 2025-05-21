vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if #vim.fn.argv() == 0 then
      vim.cmd("NvimTreeOpen")
    end
  end
})

vim.api.nvim_set_keymap(
  'n', '<C-e>', ":NvimTreeOpen<CR>", { noremap = true }
)

vim.api.nvim_set_keymap(
  'n', '<C-q>', ":NvimTreeClose<CR>", { noremap = true }
)
