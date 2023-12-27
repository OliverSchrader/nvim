local colors = require('settings.colors')

-- Lualine
vim.api.nvim_set_hl(0, 'lualine_a_normal', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_a_insert', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'lualine_a_visual', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_a_command', { fg = colors.yellow })

vim.api.nvim_set_hl(0, 'lualine_b_normal', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_b_insert', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'lualine_b_visual', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_b_command', { fg = colors.yellow })

-- Line numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.purple })

-- Neogit
vim.api.nvim_set_hl(0, 'NeogitDiffAdd', { fg = colors.green })
vim.api.nvim_set_hl(0, 'NeogitDiffAddHighlight', { fg = colors.green })
vim.api.nvim_set_hl(0, 'NeogitDiffDelete', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NeogitDiffDeleteHighlight', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NeogitDiffContextHighlight', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NeogitDiffContext', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NeogitHunkHeader', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'NeogitHunkHeaderHighlight', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'NeogitCursorLine', { bg = 'none' })

-- Git signs
vim.api.nvim_set_hl(0, 'GitSignsAddPreview', { fg = colors.green })
vim.api.nvim_set_hl(0, 'GitSignsChangePreview', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'GitSignsDeletePreview', { fg = colors.red })

-- Float borders
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = colors.blue })

-- Telescope
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = 'none' })

-- Noice
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupTitle', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon', { link = 'NoiceCmdlinePopupTitle' })

-- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = colors.red })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarning', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = colors.purple })
