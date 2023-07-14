-- Set <space> as the leader key See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = true,
      },
      'williamboman/mason-lspconfig.nvim',
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {
          window = {
            blend = 0,
          }
        }
      },
      'folke/neodev.nvim',
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
  },
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {}
  },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      preview_config = {
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree' }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diagnostics' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'diff' },
        lualine_z = { 'branch' }
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  { 'numToStr/Comment.nvim',         opts = {} },
  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  -- null-ls formatting & linting
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local sources = {
        require('null-ls').builtins.formatting.prettier,
        require('null-ls').builtins.diagnostics.eslint,
      }

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end

      require('null-ls').setup({
        debug = true,
        sources = sources,
        on_attach = on_attach,
      })
    end,
    requires = { 'nvim-lua/plenary.nvim' }
  },
  -- Tabs - BarBar
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      highlight_inactive_file_icons = true,
      sidebar_filetypes = {
        NvimTree = true,
      }
    },
  },
  -- File Explorer - nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      end

      require("nvim-tree").setup {
        on_attach = my_on_attach,
        view = {
          number = true,
          relativenumber = true,
          width = {},
        }
      }
    end,
  },
  -- Transparency
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        extra_groups = {
          -- General
          "NormalFloat",

          -- BarBar
          "BufferTabpageFill",
          "BufferCurrent",
          "BufferCurrentSign",
          "BufferCurrentSignRight",
          "BufferInactive",
          "BufferInactiveMod",
          "BufferInactiveSign",
          "BufferInactiveSignRight",
          "BufferInactiveTarget",
          "BufferInactiveIndex",
          "BufferVisible",
          "BufferVisibleMod",
          "BufferVisibleSign",
          "BufferVisibleSignRight",
          "BufferVisibleTarget",
          "BufferVisibleIndex",

          -- NvimTree
          "NvimTreeNormal",
          "NvimTreeVertSplit",
          "NvimTreeStatusLine",
          "NvimTreeStatusLineNC",
          "NvimTreeWindowPicker",
          "NvimTreeEndOfBuffer",
          "NvimTreeRootFolder",
          "NvimTreeCursorLine",

          -- Lualine
          "lualine_a_normal",
          "lualine_a_insert",
          "lualine_a_visual",
          "lualine_a_replace",
          "lualine_a_command",
          "lualine_a_inactive",

          "lualine_b_normal",
          "lualine_b_insert",
          "lualine_b_visual",
          "lualine_b_replace",
          "lualine_b_command",
          "lualine_b_inactive",

          "lualine_b_diagnostics_error_normal",
          "lualine_b_diagnostics_error_insert",
          "lualine_b_diagnostics_error_visual",
          "lualine_b_diagnostics_error_replace",
          "lualine_b_diagnostics_error_command",
          "lualine_b_diagnostics_error_inactive",

          "lualine_b_diagnostics_warn_normal",
          "lualine_b_diagnostics_warn_insert",
          "lualine_b_diagnostics_warn_visual",
          "lualine_b_diagnostics_warn_replace",
          "lualine_b_diagnostics_warn_command",
          "lualine_b_diagnostics_warn_inactive",

          "lualine_b_diagnostics_info_normal",
          "lualine_b_diagnostics_info_insert",
          "lualine_b_diagnostics_info_visual",
          "lualine_b_diagnostics_info_replace",
          "lualine_b_diagnostics_info_command",
          "lualine_b_diagnostics_info_inactive",

          "lualine_b_diagnostics_hint_normal",
          "lualine_b_diagnostics_hint_insert",
          "lualine_b_diagnostics_hint_visual",
          "lualine_b_diagnostics_hint_replace",
          "lualine_b_diagnostics_hint_command",
          "lualine_b_diagnostics_hint_inactive",

          "lualine_c_normal",
          "lualine_c_insert",
          "lualine_c_visual",
          "lualine_c_replace",
          "lualine_c_command",
          "lualine_c_inactive",

          "lualine_x_normal",
          "lualine_x_insert",
          "lualine_x_visual",
          "lualine_x_replace",
          "lualine_x_command",
          "lualine_x_inactive",

          "lualine_y_normal",
          "lualine_y_insert",
          "lualine_y_visual",
          "lualine_y_replace",
          "lualine_y_command",
          "lualine_y_inactive",
          "lualine_y_diff",

          "lualine_y_diff_added_normal",
          "lualine_y_diff_added_insert",
          "lualine_y_diff_added_visual",
          "lualine_y_diff_added_replace",
          "lualine_y_diff_added_command",
          "lualine_y_diff_added_inactive",

          "lualine_y_diff_modified_normal",
          "lualine_y_diff_modified_insert",
          "lualine_y_diff_modified_visual",
          "lualine_y_diff_modified_replace",
          "lualine_y_diff_modified_command",
          "lualine_y_diff_modified_inactive",

          "lualine_y_diff_removed_normal",
          "lualine_y_diff_removed_insert",
          "lualine_y_diff_removed_visual",
          "lualine_y_diff_removed_replace",
          "lualine_y_diff_removed_command",
          "lualine_y_diff_removed_inactive",

          "lualine_z_normal",
          "lualine_z_insert",
          "lualine_z_visual",
          "lualine_z_replace",
          "lualine_z_command",
          "lualine_z_inactive",
        },
      })
    end,
  },
  -- Copilot
  {
    'github/copilot.vim',
  },
  -- Autoclose
  {
    'm4xshen/autoclose.nvim',
    config = function()
      require("autoclose").setup()
    end
  }
}, {})

-- Settings
-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable relative line numbers
vim.wo.relativenumber = true;

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Required for icons along with a patched font
vim.o.termguicolors = true

-- Tab width
vim.opt.tabstop = 2;
vim.opt.softtabstop = 2;
vim.opt.shiftwidth = 2;

-- Basic Keymaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap for switching between windows
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- Remap to move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap to disable ZZ
vim.keymap.set("n", "ZZ", "<Nop>")

-- Remap to format the file
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>")

-- Remap for current word search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Remap to keep cursor centered
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set('n', '<A-k>', '<C-u>zz')
vim.keymap.set('n', '<A-j>', '<C-d>zz')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "p", "pzz")
vim.keymap.set("n", "P", "Pzz")
vim.keymap.set("n", "u", "uzz")
vim.keymap.set("n", "<C-r>", "<C-r>zz")

-- Remap to delete highlighted text into the void register and then paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Remap to allow scrolling in insert mode
vim.keymap.set("i", "<A-k>", "<Up>")
vim.keymap.set("i", "<A-j>", "<Down>")
vim.keymap.set("i", "<A-h>", "<Left>")
vim.keymap.set("i", "<A-l>", "<Right>")

-- Remap to disable arrow keys
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")
vim.keymap.set("v", "<Up>", "<Nop>")
vim.keymap.set("v", "<Down>", "<Nop>")
vim.keymap.set("v", "<Left>", "<Nop>")
vim.keymap.set("v", "<Right>", "<Nop>")

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'css', 'html', 'java', 'javascript', 'json', 'lua', 'markdown', 'scss', 'tsx', 'typescript',
    'vimdoc', 'vim' },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Tab keymaps
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

-- NvimTree keymaps
vim.keymap.set('n', '<A-f>', '<Cmd>NvimTreeToggle<CR>')

--  Configure LSP
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  eslint = {},
  tailwindcss = {},
  tsserver = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Configure nvim-cmp
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
    ['<A-n>'] = cmp.mapping.select_next_item(),
    ['<A-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Custom Highlights
local colors = {
  purple = '#c678dd',
  blue = '#61afef',
  red = '#e86671',
  yellow = '#e5c07b',
  green = '#98c379',
  teal = '#56b6c2',
  light_orange = '#d19a66',
}
-- Barbar transparency
vim.api.nvim_set_hl(0, "BufferCurrent", { fg = colors.purple })

-- Lualine transparency
vim.api.nvim_set_hl(0, "lualine_a_normal", { fg = colors.green })
vim.api.nvim_set_hl(0, "lualine_a_insert", { fg = colors.blue })
vim.api.nvim_set_hl(0, "lualine_a_visual", { fg = colors.purple })
vim.api.nvim_set_hl(0, "lualine_a_command", { fg = colors.light_orange })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
