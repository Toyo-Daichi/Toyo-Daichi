require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_light',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'filename', path = 1 } },
    lualine_c = { {
      'diagnostics',
      sources = { 'nvim_diagnostic', 'nvim_lsp' },
      sections = { 'error', 'warn', 'info', 'hint' },
      symbols = { error = 'E ', warn = 'W ', info = 'I ', hint = 'H ' }
    } },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  inactive_tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
