return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<A-/>]],
    direction = 'float',
    float_opts = {
      border = 'curved',
    },
    highlights = {
      FloatBorder = {
        link = 'Float',
      },
    },
    -- shell = 'bash.exe',
  },
}
