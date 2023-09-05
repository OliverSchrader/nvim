vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'ZZ', '<Nop>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap for switching between windows
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- Remap to move lines in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Remap to format the file using lsp
vim.keymap.set('n', '<A-F>', '<cmd>lua vim.lsp.buf.format()<CR>')

-- Remap for current word search and replace
vim.keymap.set(
  'n',
  '<leader>sr',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Document [S]earch and [R]eplace' }
)

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

-- Remap to leave insert mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Remap to make folds work better with indent-blankline
vim.keymap.set('n', 'za', 'za<Cmd>IndentBlanklineRefresh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'zo', 'zo<Cmd>IndentBlanklineRefresh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'zc', 'zc<Cmd>IndentBlanklineRefresh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'zR', 'zR<Cmd>IndentBlanklineRefresh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'zx', 'zx<Cmd>IndentBlanklineRefresh<CR>', { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Telescope keymaps
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = '[F]ind [O]ld files' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').live_grep, { desc = '[F]ind in [D]irectory' })
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope file_browser<CR>', { desc = '[F]ile [B]rowser' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
