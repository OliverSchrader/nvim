return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '•' },
      change = { text = '•' },
      delete = { text = '•' },
      topdelete = { text = '•' },
      changedelete = { text = '•' },
      untracked = { text = '•' },
    },
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 250,
    },
    current_line_blame_formatter = '<author> • <author_time:%Y-%m-%d> • <summary>',
    preview_config = {
      border = 'rounded',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
    on_attach = function(bufnr)
      vim.keymap.set('n', '<leader>gk', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to Previous Hunk' })
      vim.keymap.set('n', '<leader>gj', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to Next Hunk' })
      vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview Hunk' })
      vim.keymap.set('n', '<leader>rh', require('gitsigns').reset_hunk, { buffer = bufnr, desc = 'Reset Hunk' })
    end,
  },
}
