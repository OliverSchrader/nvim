vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.hlsearch = false

vim.o.mouse = ''

vim.o.clipboard = 'unnamedplus'

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.showmode = false

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.completeopt = 'menuone,preview,noinsert'

vim.o.shell = 'cmd.exe'

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
vim.o.foldcolumn = '0'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.fillchars = 'eob: '

vim.o.scrolloff = 10

vim.o.splitright = true

vim.diagnostic.config {
  float = { border = 'rounded' },
}

vim.loader.enable()

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Dealing with line endings on windows
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    local buffer = vim.api.nvim_get_current_buf()
    if vim.bo[buffer].modifiable and vim.bo[buffer].fileformat == 'unix' then
      vim.cmd 'set ff=dos'
      vim.cmd 'update'
    end
  end,
  pattern = '*',
})

-- Open help in vertical split
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'man' },
  command = 'wincmd L',
})

-- Format on save using Conform
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

-- Custom LazyGit terminal
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

function _ToggleLazyGit()
  lazygit:toggle()
end
