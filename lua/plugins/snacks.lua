local enabled = { enabled = true }

local dashboard = {
  enabled = true,
  preset = {
    keys = {
      { icon = ' ', key = 'r', desc = 'Restore Session', section = 'session' },
      { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
      { icon = ' ', key = 't', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = ' ', key = '/', desc = 'Terminal', action = ':ToggleTerm' },
      { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      { icon = '󰒲 ', key = 'l', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
  },
}

local explorer = {
  enabled = true,
  replace_netrw = true,
}

local picker = {
  enabled = true,
  focus = 'input',
  win = {
    list = {
      keys = {
        ['<C-l>'] = { 'vsplit', mode = { 'n', 'i' } },
        ['<C-k>'] = { 'split', mode = { 'n', 'i' } },
      },
    },
  },
}

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    animate = enabled,
    bigfile = enabled,
    bufdelete = enabled,
    dashboard = dashboard,
    explorer = explorer,
    indent = enabled,
    input = enabled,
    picker = picker,
    quickfile = enabled,
    scope = enabled,
  },
  keys = {
    {
      '<leader>sp',
      function()
        Snacks.picker.pickers()
      end,
      desc = 'Snacks Pickers',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers {
          current = false,
          focus = 'list',
          layout = { preset = 'select' },
          win = {
            list = {
              keys = {
                ['d'] = { 'bufdelete', mode = { 'n', 'i' } },
              },
            },
          },
        }
      end,
      desc = 'Buffer List',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer {
          git_status = false,
          git_untracked = false,
          auto_close = true,
          focus = 'list',
          layout = { preset = 'default', preview = true },
        }
      end,
      desc = 'File Explorer',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files()
      end,
      desc = 'File Search',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.lines {
          layout = { preset = 'default' },
        }
      end,
      desc = 'Buffer Fuzzy Search',
    },
    {
      '<leader>fd',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>fw',
      function()
        Snacks.picker.grep_word {
          focus = 'list',
        }
      end,
      desc = 'Find visual selection or word',
      mode = { 'n', 'x' },
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions {
          focus = 'list',
        }
      end,
      desc = 'Goto Definition',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP Symbols',
    },
    {
      '<leader>q',
      function()
        Snacks.picker.diagnostics_buffer {
          focus = 'list',
        }
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>fh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Find Help',
    },
    {
      '<leader>fhi',
      function()
        Snacks.picker.highlights()
      end,
      desc = 'Find Highlights',
    },
    {
      '<leader>i',
      function()
        Snacks.picker.icons {
          focus = 'list',
          layout = { preset = 'select' },
        }
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>c',
      function()
        Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath 'config' })
      end,
      desc = 'Config',
    },
  },
}
