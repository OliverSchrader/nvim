return {
  'HiPhish/rainbow-delimiters.nvim',
  config = function()
    require('rainbow-delimiters.setup').setup {
      query = {
        -- Doesn't seem to work :( Try again in future release
        -- javascript = 'rainbow-parens',
        -- tsx = 'rainbow-parens',
        -- typescript = 'rainbow-parens',
      },
      blacklist = { 'html' },
    }
  end,
}
