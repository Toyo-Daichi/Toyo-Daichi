local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  sources = {
    { name = 'minuet' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 50,
      ellipsis_char = '...',
      -- label each candidate with its source
      menu = {
        minuet = '[AI]',
        nvim_lsp = '[LSP]',
        path = '[Path]',
        buffer = '[Buf]',
      },
    }),
  },
  performance = {
    -- minuet answers over the network, so wait longer than the default
    fetching_timeout = 2000,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    -- request an AI completion manually
    ['<A-y>'] = require('minuet').make_cmp_map(),
  }),
})
