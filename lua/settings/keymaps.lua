vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'ZZ', '<Nop>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap for switching between splits
vim.keymap.set('n', '<A-h>', '<C-w>W', { desc = 'Switch Windows' })
vim.keymap.set('n', '<A-l>', '<C-w>w', { desc = 'Switch Windows' })

-- Remap to split a window vertically
vim.keymap.set('n', '<A-v>', '<C-w>v', { desc = 'Split window vertically' })

-- Remap to close a window
vim.keymap.set('n', '<A-q>', '<C-w>q', { desc = 'Close window' })

-- Remap for increasing/descreasing window width
vim.keymap.set('n', '<A->>', '<C-w>>')
vim.keymap.set('n', '<A-<>', '<C-w><')

-- Remap to move lines in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Remap to format the file using lsp
vim.keymap.set('n', '<A-F>', '<cmd>lua require("conform").format()<CR>')

-- Remap for current word search and replace
vim.keymap.set('n', '<leader>sr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Buffer [S]earch and [R]eplace' })

-- Remap to delete highlighted text into the void register and then paste
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Remap to keep cursor centered during half page jumps
vim.keymap.set('n', '<A-k>', '<C-u>zz')
vim.keymap.set('n', '<A-j>', '<C-d>zz')

-- Remap to move cursor in insert mode
vim.keymap.set('i', '<A-k>', '<Up>')
vim.keymap.set('i', '<A-j>', '<Down>')
vim.keymap.set('i', '<A-h>', '<Left>')
vim.keymap.set('i', '<A-l>', '<Right>')

-- Remap to scroll buffer
vim.keymap.set('n', '<A-e>', '<C-e>')
vim.keymap.set('n', '<A-y>', '<C-y>')

-- Remap to disable arrow keys
vim.keymap.set('n', '<Up>', '<Nop>')
vim.keymap.set('n', '<Down>', '<Nop>')
vim.keymap.set('n', '<Left>', '<Nop>')
vim.keymap.set('n', '<Right>', '<Nop>')
vim.keymap.set('i', '<Up>', '<Nop>')
vim.keymap.set('i', '<Down>', '<Nop>')
vim.keymap.set('i', '<Left>', '<Nop>')
vim.keymap.set('i', '<Right>', '<Nop>')
vim.keymap.set('v', '<Up>', '<Nop>')
vim.keymap.set('v', '<Down>', '<Nop>')
vim.keymap.set('v', '<Left>', '<Nop>')
vim.keymap.set('v', '<Right>', '<Nop>')

-- Remap to exit insert mode
vim.keymap.set('i', 'jj', '<Esc>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- LazyGit
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _ToggleLazyGit()<CR>', { noremap = true, silent = true })

-- Note keymaps
vim.keymap.set('n', '<leader>n', function()
  require('global-note').toggle_note 'project_local'
end, {
  desc = 'Toggle global note',
})

-- Copilot keymaps
vim.keymap.set('i', '<S-Tab>', function()
  if require('copilot.suggestion').is_visible() then
    require('copilot.suggestion').accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
  end
end, {
  silent = true,
})
vim.keymap.set('i', '<S-CR>', function()
  if require('copilot.suggestion').is_visible() then
    require('copilot.suggestion').dismiss()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, false, true), 'n', false)
  end
end, {
  silent = true,
})
