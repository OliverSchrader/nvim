return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local function on_attach(bufnr)
      local api = require 'nvim-tree.api'
      local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set('n', '<Tab>', api.node.open.tab, opts)
    end

    local function center_float_window(config)
      local screen_width = vim.api.nvim_get_option 'columns'
      local screen_height = vim.api.nvim_get_option 'lines'

      local width = config.width or math.floor(screen_width * 0.8)
      local height = config.height or math.floor(screen_height * 0.8)

      config.width = width
      config.height = height
      config.row = math.floor((screen_height - height) / 2)
      config.col = math.floor((screen_width - width) / 2)

      return config
    end

    require('nvim-tree').setup {
      on_attach = on_attach,
      git = {
        enable = false,
      },
      view = {
        float = {
          enable = true,
          open_win_config = center_float_window {
            relative = 'editor',
            row = 15,
            col = 15,
            border = 'rounded',
          },
        },
      },
      renderer = {
        indent_markers = {
          enable = false,
        },
        icons = {
          show = {
            git = false,
          },
        },
      },
    }
  end,
}
