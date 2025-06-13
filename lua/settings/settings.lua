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
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
vim.o.foldcolumn = '0'
vim.o.scrolloff = 10
vim.o.splitright = true
vim.o.autoread = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.showtabline = 1
vim.opt.laststatus = 3
vim.opt.fillchars = { eob = ' ' }

vim.diagnostic.config({
  float = {
    border = 'rounded',
  },
  -- virtual_lines = {
  --   current_line = true,
  -- },
  virtual_text = true,
})

vim.loader.enable()

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
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

-- LazyGit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
})

function _ToggleLazyGit()
  lazygit:toggle()
end

-- Refresh buffers after exiting LazyGit
vim.api.nvim_create_autocmd({ 'TermClose' }, {
  pattern = '*lazygit*',
  callback = function()
    vim.defer_fn(function()
      vim.cmd('checktime')

      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == '' then
          local bufname = vim.api.nvim_buf_get_name(buf)
          if bufname ~= '' and vim.fn.filereadable(bufname) == 1 then
            vim.api.nvim_buf_call(buf, function()
              vim.cmd('e!')
            end)
          end
        end
      end

      if package.loaded['gitsigns'] then
        require('gitsigns').refresh()
      end
    end, 100)
  end,
})

-- Custom tab names
vim.o.tabline = '%!v:lua.TabLine()'

function _G.TabLine()
  local tab_pages = ''
  local padding = '   '
  for i = 1, vim.fn.tabpagenr('$') do
    local buf_list = vim.fn.tabpagebuflist(i)
    local buf_name = vim.fn.bufname(buf_list[1])
    local file_name = vim.fn.fnamemodify(buf_name, ':t')

    if i == vim.fn.tabpagenr() then
      tab_pages = tab_pages .. '%#TabLineSel#' .. file_name .. padding
    else
      tab_pages = tab_pages .. '%#TabLine#' .. file_name .. padding
    end
  end
  return tab_pages
end

-- Dealing with windows line endings
-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   callback = function()
--     local buffer = vim.api.nvim_get_current_buf()
--     if vim.bo[buffer].modifiable and vim.bo[buffer].fileformat == 'unix' and vim.api.nvim_buf_get_name(buffer) ~= '' then
--       vim.cmd 'set ff=dos'
--       vim.cmd 'update'
--     end
--   end,
--   pattern = '*',
-- })
