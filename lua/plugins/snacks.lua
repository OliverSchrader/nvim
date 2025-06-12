local enabled = { enabled = true }

local dashboard = {
  enabled = true,
  preset = {
    keys = {
      { icon = ' ', key = 'r', desc = 'Restore Session', section = 'session' },
      { icon = '󰙅 ', key = 'e', desc = 'Explorer', action = '<leader>e' },
      { icon = ' ', key = 'f', desc = 'Find File', action = '<leader>ff' },
      { icon = ' ', key = 't', desc = 'Find Text', action = '<leader>fd' },
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

local keys = {
  ['<A-]>'] = { 'vsplit', mode = { 'n', 'i' } },
  ['<A-[>'] = { 'split', mode = { 'n', 'i' } },
}

local picker = {
  enabled = true,
  focus = 'input',
  ignored = true,
  hidden = true,
  win = {
    input = { keys = keys },
    list = { keys = keys },
  },
}

local indent = {
  enabled = true,
  animate = { enabled = true },
  chunk = {
    enabled = true,
    char = {
      corner_top = '╭',
      corner_bottom = '╰',
      horizontal = '─',
      vertical = '│',
      arrow = '─',
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
    indent = indent,
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
                ['d'] = { 'bufdelete', mode = { 'n' } },
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
          git_status = true,
          git_untracked = true,
          exclude = { 'node_modules', 'coverage' },
          auto_close = true,
          follow_file = true,
          focus = 'list',
          diagnostics_open = true,
          layout = { preset = 'default', preview = true },
        }
      end,
      desc = 'File Explorer',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files {
          exclude = { 'node_modules', 'coverage', '.m2', '*.class' },
          hidden = true,
          ignored = true,
        }
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
        Snacks.picker.grep {
          exclude = { 'node_modules', 'coverage', '*.lock', '.m2', '*.class' },
          hidden = true,
          ignored = true,
        }
      end,
      desc = 'Grep',
    },
    {
      '<leader>fw',
      function()
        Snacks.picker.grep_word {
          focus = 'list',
          exclude = { 'node_modules', 'coverage', '*.lock', '.m2', '*.class' },
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
        Snacks.picker.lsp_references {
          focus = 'list',
        }
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
          focus = 'input',
          layout = { preset = 'select' },
        }
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>cf',
      function()
        Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath 'config' })
      end,
      desc = 'Config',
    },
    {
      '<leader>ft',
      function()
        ---@diagnostic disable-next-line: undefined-field
        Snacks.picker.todo_comments {
          focus = 'list',
          title = 'Todos',
          exclude = { 'node_modules', 'coverage', '*.class' },
        }
      end,
      desc = 'Todos',
    },
  },
}
