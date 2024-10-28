return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    require('rainbow-delimiters.setup').setup {
      query = {
        javascript = 'rainbow-delimiters',
        typescript = 'rainbow-delimiters',
      },
      blacklist = { 'html' },
    }
  end,
}
