local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<A-j>'] = cmp.mapping.select_next_item(),
    ['<A-k>'] = cmp.mapping.select_prev_item(),
    ['<TAB>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = 'Normal:Normal,FloatBorder:Float,CursorLine:Visual,Search:None',
      scrollbar = false,
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = 'Normal:Normal,FloatBorder:Float,CursorLine:Visual,Search:None',
    }),
  },
  sources = {
    { name = 'nvim_lsp', priority = 30 },
    { name = 'luasnip', priority = 10 },
  },
}
