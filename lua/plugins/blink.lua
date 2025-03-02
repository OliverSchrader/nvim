return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'xzbdmw/colorful-menu.nvim',
  },
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ['<Tab>'] = { 'snippet_forward', 'select_and_accept', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'show', 'show_documentation', 'hide_documentation' },
      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      ['<A-k>'] = { 'select_prev', 'fallback' },
      ['<A-j>'] = { 'select_next', 'fallback' },
      ['<A-K>'] = { 'scroll_documentation_up', 'fallback' },
      ['<A-J>'] = { 'scroll_documentation_down', 'fallback' },
    },
    completion = {
      keyword = { range = 'full' },
      menu = {
        border = 'rounded',
        auto_show = true,
        scrollbar = true,
        draw = {
          columns = { { 'kind_icon' }, { 'label', gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require('colorful-menu').blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require('colorful-menu').blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
      ghost_text = { enabled = false },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = 'rounded',
        },
      },
      accept = {
        auto_brackets = {
          kind_resolution = {
            blocked_filetypes = {},
          },
        },
      },
    },
    appearance = { nerd_font_variant = 'mono' },
    sources = {
      default = { 'lsp', 'path', 'snippets' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    cmdline = {
      keymap = {
        ['<A-k>'] = { 'select_prev', 'fallback' },
        ['<A-j>'] = { 'select_next', 'fallback' },
        ['<Tab>'] = { 'select_and_accept', 'fallback' },
        ['<S-Tab>'] = { 'show', 'show_documentation', 'hide_documentation' },
      },
      completion = {
        menu = { auto_show = true },
        ghost_text = { enabled = false },
      },
    },
    signature = {
      enabled = false,
      window = {
        border = 'rounded',
      },
    },
  },
  opts_extend = { 'sources.default' },
}
