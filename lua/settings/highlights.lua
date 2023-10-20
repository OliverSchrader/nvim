local colors = {
  purple = '#c678dd',
  blue = '#61afef',
  red = '#e86671',
  yellow = '#e5c07b',
  green = '#98c379',
  teal = '#56b6c2',
  orange = '#d19a66',
  grey = '#18181c',
}

-- General
vim.api.nvim_set_hl(0, 'Visual', { fg = colors.purple, bg = colors.grey })
vim.api.nvim_set_hl(0, 'IncSearch', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'VertSplit', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'LspFloatWinBorder', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.yellow })

-- Telescope
vim.api.nvim_set_hl(0, 'TelescopeSelection', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'TelescopePreviewRead', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBlock', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'TelescopePreviewPipe', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'TelescopePreviewCharDev', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = colors.red })

-- Indentation
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent1', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent2', { fg = colors.green })
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent3', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent4', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent5', { fg = colors.red })
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent6', { fg = colors.teal })
vim.api.nvim_set_hl(0, 'IndentBlanklineIndent7', { fg = colors.orange })

-- Lualine
vim.api.nvim_set_hl(0, 'lualine_a_normal', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_a_insert', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_a_visual', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'lualine_a_command', { fg = colors.orange })

-- Transparency
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'FloatShadow', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'FloatShadowThrough', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = colors.purple })

-- Noice
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'NoiceVirtualText', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'NoiceScrollbar', { fg = colors.grey })
vim.api.nvim_set_hl(0, 'NoiceScrollbarThumb', { bg = colors.purple })

-- Notify
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = colors.purple })
