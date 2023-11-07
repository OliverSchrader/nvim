return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = 'frappe',
		transparent_background = true,
		term_colors = true,
		show_end_of_buffer = false,
		no_italic = true,
		custom_highlights = function(colors)
			return {
				IndentBlanklineIndent1 = { fg = colors.pink },
				IndentBlanklineIndent2 = { fg = colors.blue },
				IndentBlanklineIndent3 = { fg = colors.green },
				IndentBlanklineIndent4 = { fg = colors.yellow },
				IndentBlanklineIndent5 = { fg = colors.teal },
				IndentBlanklineIndent6 = { fg = colors.lavender },
				IndentBlanklineIndent7 = { fg = colors.red },
				IlluminatedWordText    = { underline = true, bg = 'none' },
				IlluminatedWordRead    = { underline = true, bg = 'none' },
				IlluminatedWordWrite   = { underline = true, bg = 'none' },
				illuminatedWord        = { underline = true, bg = 'none' },
				illuminatedCurWord     = { underline = true, bg = 'none' },
			}
		end,
		integrations = {
			alpha = true,
			mason = true,
			noice = true,
			notifier = true,
			notify = true,
			treesitter = true,
			telescope = {
				enabled = true,
			},
			illuminate = {
				enabled = true,
				lsp = false
			},
			which_key = true,
		}
	}
}
