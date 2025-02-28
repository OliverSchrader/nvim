return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    lsp = {
      progress = {
        enabled = false,
      },
      signature = {
        auto_open = {
          enabled = true,
        },
      },
    },
    presets = {
      lsp_doc_border = true,
    },
    views = {
      cmdline_popup = {
        position = {
          row = 16,
          col = '50%',
        },
        size = {
          width = 'auto',
          height = 'auto',
        },
      },
      popupmenu = {
        relative = 'editor',
        position = {
          row = 19,
          col = '50%',
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = 'rounded',
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = 'Normal', FloatBorder = 'FloatBorder' },
        },
      },
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          kind = '',
          find = 'written',
        },
        opts = { skip = true },
      },
      {
        view = 'notify',
        filter = { event = 'msg_showmode' },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      config = function()
        require('notify').setup {
          background_colour = '#000000',
          fps = 60,
          stages = 'fade_in_slide_out',
          top_down = false,
        }
      end,
    },
  },
}
