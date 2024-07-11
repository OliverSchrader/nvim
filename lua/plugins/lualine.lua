return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { 'alpha' },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        {
          'filename',
          file_status = true,
          newfile_status = false,
          path = 0,
          symbols = {
            modified = '',
            readonly = '',
            unnamed = '[No Name]',
            newfile = '[New]',
          }
        },
      },
      lualine_c = {
        {
          'filetype',
          icon_only = true,
          icon = {
            align = 'left',
          }
        },
      },
      lualine_x = { 'diagnostics' },
      lualine_y = { 'diff' },
      lualine_z = { 'branch' }
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {
        {
          'filetype',
          icon_only = true,
          icon = {
            align = 'left',
          }
        },

      },
      lualine_c = {},
      lualine_x = { 'diagnostics' },
      lualine_y = { 'diff' },
      lualine_z = {}
    },
  },
}
