local colors = {
  green = '#A6E3A1',
  blue = '#87B0F9',
  lavender = '#B4BEFE',
  peach = '#FAB387',
  pink = '#F5C2E7',
}
-- Lualine
vim.api.nvim_set_hl(0, 'lualine_a_normal', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_a_insert', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_a_visual', { fg = colors.lavender })
vim.api.nvim_set_hl(0, 'lualine_a_command', { fg = colors.peach })

vim.api.nvim_set_hl(0, 'lualine_b_normal', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_b_insert', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_b_visual', { fg = colors.lavender })
vim.api.nvim_set_hl(0, 'lualine_b_command', { fg = colors.peach })

-- Line Numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.blue })
