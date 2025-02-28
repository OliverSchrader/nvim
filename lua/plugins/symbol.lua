local colors = require('catppuccin.palettes').get_palette 'frappe'

return {
  'Wansmer/symbol-usage.nvim',
  event = 'LspAttach',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('symbol-usage').setup {
      hl = { fg = colors.red },
      request_pending_text = '? usages',
    }
  end,
}
