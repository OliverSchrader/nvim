return {
  'saghen/blink.cmp',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    'xzbdmw/colorful-menu.nvim',
  },
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ['<Tab>'] = { 'select_and_accept', 'fallback' },
      ['<S-Tab>'] = { 'show', 'show_documentation', 'hide_documentation' },
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
          enabled = false,
          kind_resolution = {
            enabled = false,
            blocked_filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
          },
        },
      },
    },
    appearance = { nerd_font_variant = 'mono' },
    sources = {
      default = { 'lsp', 'buffer', 'path' },
    },
    fuzzy = {
      implementation = 'prefer_rust_with_warning',
      use_frecency = true,
      sorts = { 'exact', 'score', 'sort_text' },
    },
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
