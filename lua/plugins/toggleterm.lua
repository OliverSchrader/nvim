return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    open_mapping = [[<A-/>]],
    direction = 'float',
    float_opts = {
      border = 'curved',
      width = 160,
    },
    highlights = {
      FloatBorder = {
        link = 'TelescopeResultsBorder'
      },
    },
    shell = 'bash.exe',
  }
}
