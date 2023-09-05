return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
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
        -- {
        --   'filetype',
        --   icon_only = true,
        --   icon = {
        --     align = 'left',
        --   }
        -- },
      },
      lualine_x = { 'diagnostics' },
      lualine_y = { 'diff' },
      lualine_z = { 'branch' }
    },
  },
}
