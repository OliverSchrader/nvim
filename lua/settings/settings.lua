vim.wo.number = true
vim.wo.relativenumber = true

vim.wo.signcolumn = 'yes'

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

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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
