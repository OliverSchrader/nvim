local colors = require('catppuccin.palettes').get_palette 'frappe'

-- Borders
vim.api.nvim_set_hl(0, 'Float', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Float' })
vim.api.nvim_set_hl(0, 'WinSeparator', { link = 'Float' })
vim.api.nvim_set_hl(0, 'NeogitWinSeparator', { link = 'Float' })

-- Snacks
vim.api.nvim_set_hl(0, 'SnacksPickerTitle', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'SnacksPickerCursorLine', { fg = colors.yellow, bold = true })
vim.api.nvim_set_hl(0, 'SnacksPickerListCursorLine', { link = 'SnacksPickerCursorLine' })
vim.api.nvim_set_hl(0, 'SnacksPickerTotals', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'SnacksIndentScope', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'SnacksDashboardKey', { fg = colors.mauve })

-- LSP
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = colors.red })

-- Blink
vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { link = 'Float' })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { link = 'SnacksPickerListCursorLine' })
vim.api.nvim_set_hl(0, 'BlinkCmpSignatureHelpBorder', { link = 'Float' })
vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', { link = 'Float' })
vim.api.nvim_set_hl(0, 'BlinkCmpScrollBarThumb', { bg = colors.mauve })
vim.api.nvim_set_hl(0, 'BlinkCmpScrollBarGutter', { link = 'Float' })

-- Snippet
vim.api.nvim_set_hl(0, 'SnippetTabStop', { bg = 'none', fg = colors.yellow })

-- Lualine
vim.api.nvim_set_hl(0, 'lualine_a_normal', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'lualine_a_insert', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_a_visual', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_a_command', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'lualine_a_terminal', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'lualine_a_replace', { fg = colors.red })

vim.api.nvim_set_hl(0, 'lualine_b_normal', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'lualine_b_insert', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_b_visual', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_b_command', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'lualine_b_terminal', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'lualine_b_replace', { fg = colors.red })

vim.api.nvim_set_hl(0, 'lualine_c_normal', { fg = colors.mauve })
vim.api.nvim_set_hl(0, 'lualine_c_insert', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'lualine_c_visual', { fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_c_command', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'lualine_c_terminal', { fg = colors.peach })
vim.api.nvim_set_hl(0, 'lualine_c_replace', { fg = colors.red })

vim.api.nvim_set_hl(0, 'lualine_z_diff_added_normal', { bg = 'none', fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_z_diff_added_insert', { bg = 'none', fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_z_diff_added_visual', { bg = 'none', fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_z_diff_added_command', { bg = 'none', fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_z_diff_added_terminal', { bg = 'none', fg = colors.green })
vim.api.nvim_set_hl(0, 'lualine_z_diff_added_replace', { bg = 'none', fg = colors.green })

vim.api.nvim_set_hl(0, 'lualine_z_diff_modified_normal', { bg = 'none', fg = colors.yellow })
vim.api.nvim_set_hl(0, 'lualine_z_diff_modified_insert', { bg = 'none', fg = colors.yellow })
vim.api.nvim_set_hl(0, 'lualine_z_diff_modified_visual', { bg = 'none', fg = colors.yellow })
vim.api.nvim_set_hl(0, 'lualine_z_diff_modified_command', { bg = 'none', fg = colors.yellow })
vim.api.nvim_set_hl(0, 'lualine_z_diff_modified_terminal', { bg = 'none', fg = colors.yellow })
vim.api.nvim_set_hl(0, 'lualine_z_diff_modified_replace', { bg = 'none', fg = colors.yellow })

vim.api.nvim_set_hl(0, 'lualine_z_diff_removed_normal', { bg = 'none', fg = colors.red })
vim.api.nvim_set_hl(0, 'lualine_z_diff_removed_insert', { bg = 'none', fg = colors.red })
vim.api.nvim_set_hl(0, 'lualine_z_diff_removed_visual', { bg = 'none', fg = colors.red })
vim.api.nvim_set_hl(0, 'lualine_z_diff_removed_command', { bg = 'none', fg = colors.red })
vim.api.nvim_set_hl(0, 'lualine_z_diff_removed_terminal', { bg = 'none', fg = colors.red })
vim.api.nvim_set_hl(0, 'lualine_z_diff_removed_replace', { bg = 'none', fg = colors.red })

-- Line Numbers
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.blue })

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

-- Noice
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { link = 'Float' })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupTitleCmdline', { link = 'SnacksPickerTitle' })
vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon', { link = 'SnacksPickerTitle' })
