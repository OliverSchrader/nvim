local actions = require 'telescope.actions'

require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = 'top',
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-l>'] = actions.select_vertical,
        ['<C-k>'] = actions.select_horizontal,
      },
      n = {
        ['<C-l>'] = actions.select_vertical,
        ['<C-k>'] = actions.select_horizontal,
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
      -- theme = 'dropdown',
      previewer = true,
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
      file_ignore_patterns = {
        'node_modules',
        'keycloak',
      },
    },
    live_grep = {
      file_ignore_patterns = {
        'node_modules',
        'keycloak',
        'yarn.lock',
        'package.lock',
      },
    },
    oldfiles = {
      hidden = true,
      previewer = true,
      initial_mode = 'normal',
    },
    lsp_references = {
      initial_mode = 'normal',
      show_line = false,
    },
    diagnostics = {
      initial_mode = 'normal',
      hide_filename = true,
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      hijack_netrw = true,
      git_status = false,
      grouped = true,
      initial_mode = 'normal',
    },
    undo = {
      initial_mode = 'normal',
      mappings = {
        n = {
          ['<cr>'] = require('telescope-undo.actions').restore,
        },
      },
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
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
pcall(require('telescope').load_extension, 'undo')
