require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = 'bottom',
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
    },
    oldfiles = {
      hidden = true,
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      theme = 'dropdown',
      hijack_netrw = true,
      git_status = false,
      grouped = true,
      layout_config = {
        prompt_position = 'top',
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'file_browser')
