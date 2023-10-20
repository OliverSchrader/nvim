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
  },
  pickers = {
    buffers = {
      initial_mode = 'insert',
      theme = 'dropdown',
      previewer = false,
      ignore_current_buffer = true,
      sort_lastused = true,
      sort_mru = true,
      layout_config = {
        prompt_position = 'top',
      },
      mappings = {
        n = {
          ['d'] = 'delete_buffer',
        },
      },
    },
    find_files = {
      hidden = true,
      theme = 'dropdown',
      previewer = false,
    },
    live_grep = {
      sorting_strategy = 'ascending',
    },
    oldfiles = {
      hidden = true,
      theme = 'dropdown',
      previewer = false,
      initial_mode = 'normal',
    },
    git_status = {
      theme = 'dropdown',
      previewer = false,
      initial_mode = 'normal',
      layout_config = {
        prompt_position = 'top',
      },
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
