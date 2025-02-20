return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  lazy = false,
  opts = {
    flavour = 'frappe',
    transparent = true,
    transparent_background = true,
    term_colors = true,
    show_end_of_buffer = false,
    no_italic = true,
    integrations = {
      mason = true,
      noice = true,
      notifier = true,
      notify = true,
      treesitter = true,
      illuminate = {
        enabled = true,
        lsp = false,
      },
      which_key = true,
    },
  },
}
