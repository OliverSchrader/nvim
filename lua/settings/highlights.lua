local colors = require('settings.colors')

-- Line numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.blue })

-- Window seperators
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.blue })

-- Folds
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.yellow })

-- Lualine
vim.api.nvim_set_hl(0, 'lualine_a_normal', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_a_insert', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'lualine_a_visual', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_a_command', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'lualine_b_normal', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_b_insert', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'lualine_b_visual', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_b_command', { fg = colors.yellow })

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

-- Noice
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { link = 'TelescopeResultsBorder' })
vim.api.nvim_set_hl(0, 'NoiceVirtualText', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'NoiceScrollbar', { fg = colors.white })
vim.api.nvim_set_hl(0, 'NoiceScrollbarThumb', { bg = colors.purple })

-- Notify
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = colors.purple })
