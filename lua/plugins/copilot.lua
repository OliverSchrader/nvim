return {
	'zbirenbaum/copilot.lua',
	cmd = 'Copilot',
	event = 'InsertEnter',
	opts = {
		suggestion = {
			enabled = false,
			auto_trigger = true,
			keymap = {
				accept = false,
				accept_word = false,
				accept_line = false,
				next = "<A-]>",
				prev = "<A-[>",
				dismiss = "<A-d>",
			}
		},
	}
}
