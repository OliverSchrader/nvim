return {
	'backdround/global-note.nvim',
	config = function()
		require('global-note').setup {
			title = " Notes ",
			window_config = function()
				local window_height = vim.api.nvim_list_uis()[1].height
				local window_width = vim.api.nvim_list_uis()[1].width
				return {
					relative = "editor",
					border = "rounded",
					title = "Note",
					title_pos = "center",
					width = math.floor(0.7 * window_width),
					height = math.floor(0.85 * window_height),
					row = math.floor(0.05 * window_height),
					col = math.floor(0.15 * window_width),
				}
			end,
			additional_presets = {
				project_local = {
					command_name = "ProjectNote",

					filename = function()
						local get_project_name = function()
							local project_directory, err = vim.loop.cwd()
							if project_directory == nil then
								vim.notify(err, vim.log.levels.WARN)
								return nil
							end

							local project_name = vim.fs.basename(project_directory)
							if project_name == nil then
								vim.notify("Unable to get the project name",
									vim.log.levels.WARN)
								return nil
							end

							return project_name
						end

						return get_project_name() .. ".md"
					end,

					title = " Notes ",
				},
			}
		}
	end,
}
