return {
  'anuvyklack/pretty-fold.nvim',
  config = function()
    require('pretty-fold').setup({
      sections = {
        left = {
          'content', '• ', 'number_of_folded_lines', ' •',
        },
        right = {}
      },
    })
  end
}
