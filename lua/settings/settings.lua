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

vim.opt.showtabline = 1

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
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*',
--   callback = function(args)
--     require('conform').format { bufnr = args.buf }
--   end,
-- })

-- Custom LazyGit terminal
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  hidden = true,
}

function _ToggleLazyGit()
  lazygit:toggle()
end

-- Custom tab names
vim.o.tabline = '%!v:lua.TabLine()'

function _G.TabLine()
  local tab_pages = ''
  local padding = '   '
  for i = 1, vim.fn.tabpagenr '$' do
    -- Get the list of buffers for the current tab
    local buf_list = vim.fn.tabpagebuflist(i)
    -- Get the first buffer in the list (the one that's active in this tab)
    local buf_name = vim.fn.bufname(buf_list[1])
    local file_name = vim.fn.fnamemodify(buf_name, ':t') -- Only display the file name (without path)

    -- If the tab is the current tab, highlight it differently
    if i == vim.fn.tabpagenr() then
      tab_pages = tab_pages .. '%#TabLineSel#' .. file_name .. padding
    else
      tab_pages = tab_pages .. '%#TabLine#' .. file_name .. padding
    end
  end
  return tab_pages
end
