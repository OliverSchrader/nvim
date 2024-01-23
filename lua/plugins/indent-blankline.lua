local colors = require('settings.colors')

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local hooks = require 'ibl.hooks'

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'Indent1', { fg = colors.blue })
      vim.api.nvim_set_hl(0, 'Indent2', { fg = colors.orange })
      vim.api.nvim_set_hl(0, 'Indent3', { fg = colors.green })
      vim.api.nvim_set_hl(0, 'Indent4', { fg = colors.purple })
      vim.api.nvim_set_hl(0, 'Indent5', { fg = colors.cyan })
      vim.api.nvim_set_hl(0, 'Indent6', { fg = colors.red })
      vim.api.nvim_set_hl(0, 'Indent7', { fg = colors.yellow })
    end)

    require('ibl').setup({
      indent = {
        char = "│",
        -- highlight = {
          -- "Indent1",
          -- "Indent2",
          -- "Indent3",
          -- "Indent4",
          -- "Indent5",
          -- "Indent6",
          -- "Indent7",
        -- }
      },
      scope = {
        enabled = false,
      }
    })
  end,
}
