return {
  'm4xshen/hardtime.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = {
    hints = {
      ['[dcyvV][ia][%(%)]'] = {
        message = function(keys)
          return 'Use ' .. keys:sub(1, 2) .. 'b instead of ' .. keys
        end,
        length = 3,
      },
    },
    disabled_filetypes = {
      'checkhealth',
      'grug-far',
      'help',
      'lazy',
      'lspinfo',
      'mason',
      'noice',
      'notify',
      'prompt',
    },
  },
}
