local colors = require('catppuccin.palettes').get_palette 'frappe'

-- Borders
vim.api.nvim_set_hl(0, 'Float', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Float' })
vim.api.nvim_set_hl(0, 'WinSeparator', { link = 'Float' })
vim.api.nvim_set_hl(0, 'NeogitWinSeparator', { link = 'Float' })

-- Telescope
vim.api.nvim_set_hl(0, 'TelescopeTitle', { fg = colors.blue })

-- LSP
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = colors.red })

-- Noice
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { link = 'Float' })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupTitle', { link = 'TelescopeTitle' })
vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon', { link = 'TelescopeTitle' })

-- Lualine
vim.api.nvim_set_hl(0, 'lualine_a_normal', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'lualine_a_insert', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_a_visual', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_a_command', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'lualine_a_terminal', { fg = colors.peach })

vim.api.nvim_set_hl(0, 'lualine_b_normal', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'lualine_b_insert', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_b_visual', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_b_command', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'lualine_b_terminal', { fg = colors.peach })

-- Line Numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.blue })

-- Neogit
vim.api.nvim_set_hl(0, 'NeogitDiffAdd', { fg = colors.green })
vim.api.nvim_set_hl(0, 'NeogitDiffAddHighlight', { fg = colors.green })
vim.api.nvim_set_hl(0, 'NeogitDiffDelete', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NeogitDiffDeleteHighlight', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NeogitDiffContextHighlight', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NeogitDiffContext', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NeogitHunkHeader', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'NeogitHunkHeaderHighlight', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'NeogitCursorLine', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NeogitFloatHeader', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NeogitFloatHeaderHighlight', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NeogitHunkHeaderCursor', { bg = 'none', fg = colors.mauve })
vim.api.nvim_set_hl(0, 'NeogitDiffContextCursor', { bg = 'none' })

-- Illuminate
vim.api.nvim_set_hl(0, 'IlluminatedWordText', { underline = true, bg = 'none' })
vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { underline = true, bg = 'none' })
vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { underline = true, bg = 'none' })
vim.api.nvim_set_hl(0, 'illuminatedWord', { underline = true, bg = 'none' })
vim.api.nvim_set_hl(0, 'illuminatedCurWord', { underline = true, bg = 'none' })

-- Tabs
vim.api.nvim_set_hl(0, 'TabLine', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'none', fg = colors.mauve })

-- Flash
vim.api.nvim_set_hl(0, 'FlashLabel', { fg = colors.mauve })
