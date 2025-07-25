vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.termguicolors = true

-- Install package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'nvim-tree/nvim-web-devicons',
  'tpope/vim-sleuth',
  'RRethy/vim-illuminate',
  'windwp/nvim-ts-autotag',
  'folke/which-key.nvim',
  'numToStr/Comment.nvim',
  { import = 'plugins' },
}, {
  ui = {
    border = 'rounded',
  },
})

require('neodev').setup()

require('settings.settings')
require('settings.keymaps')
require('plugins.treesitter')
require('settings.lsp')

vim.cmd.colorscheme('catppuccin')

require('settings.themes.catppuccin.highlights')

-- :h modeline
-- vim: ts=2 sts=2 sw=2 et
