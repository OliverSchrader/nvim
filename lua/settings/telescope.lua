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
      initial_mode = 'normal',
      ignore_current_buffer = true,
      theme = 'dropdown',
      previewer = false,
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
      theme = 'dropdown',
      previewer = false,
    },
    oldfiles = {
      hidden = true,
      theme = 'dropdown',
      previewer = false,
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      theme = 'dropdown',
      previewer = false,
      hijack_netrw = true,
      initial_mode = 'normal',
      git_status = false,
      grouped = true,
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'file_browser')
