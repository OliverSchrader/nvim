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
				IlluminatedWordText  = { underline = true, bg = 'none' },
				IlluminatedWordRead  = { underline = true, bg = 'none' },
				IlluminatedWordWrite = { underline = true, bg = 'none' },
				illuminatedWord      = { underline = true, bg = 'none' },
				illuminatedCurWord   = { underline = true, bg = 'none' },
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
