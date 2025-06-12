return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    require('rainbow-delimiters.setup').setup {
      query = {
        javascript = 'rainbow-parens',
        tsx = 'rainbow-parens',
        typescript = 'rainbow-parens',
      },
      blacklist = { 'html' },
    }
  end,
}
