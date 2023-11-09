local colors = require('settings.colors')

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local hooks = require 'ibl.hooks'

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'Indent1', { fg = colors.pink })
      vim.api.nvim_set_hl(0, 'Indent2', { fg = colors.maroon })
      vim.api.nvim_set_hl(0, 'Indent3', { fg = colors.green })
      vim.api.nvim_set_hl(0, 'Indent4', { fg = colors.yellow })
      vim.api.nvim_set_hl(0, 'Indent5', { fg = colors.blue })
      vim.api.nvim_set_hl(0, 'Indent6', { fg = colors.mauve })
    end)

    require('ibl').setup({
      indent = {
        char = "│",
        highlight = {
          "Indent1",
          "Indent2",
          "Indent3",
          "Indent4",
          "Indent5",
          "Indent6",
        }
      },
      scope = {
        enabled = false,
      }
    })
  end,
}
