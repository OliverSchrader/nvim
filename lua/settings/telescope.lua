require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = 'top',
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    path_display = {
      'tail',
    },
    sorting_strategy = 'ascending',
  },
  pickers = {
    buffers = {
      initial_mode = 'normal',
      theme = 'dropdown',
      previewer = false,
      ignore_current_buffer = true,
      sort_lastused = true,
      sort_mru = true,
      mappings = {
        n = {
          ['d'] = 'delete_buffer',
        },
      },
    },
    find_files = {
      hidden = true,
      previewer = true,
      theme = 'dropdown',
    },
    live_grep = {
      theme = 'dropdown',
    },
    current_buffer_fuzzy_find = {
      theme = 'dropdown',
    },
    oldfiles = {
      hidden = true,
      previewer = true,
      initial_mode = 'normal',
      theme = 'dropdown',
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      theme = 'dropdown',
      hijack_netrw = true,
      git_status = false,
      grouped = true,
      initial_mode = 'normal',
      layout_config = {
        prompt_position = 'top',
      },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        initial_mode = 'normal',
        sorting_strategy = 'ascending',
        layout_strategy = 'center',
        layout_config = {
          prompt_position = 'top',
          width = 0.4,
          height = 0.3,
        },
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'file_browser')
pcall(require('telescope').load_extension, 'noice')
pcall(require('telescope').load_extension, 'ui-select')
