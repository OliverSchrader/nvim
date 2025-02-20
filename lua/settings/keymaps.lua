vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'ZZ', '<Nop>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap for switching between vertically split windows
vim.keymap.set('n', '<A-h>', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<A-l>', '<C-w>l', { desc = 'Go to right window' })

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
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', require('telescope.builtin').diagnostics, { desc = 'Open diagnostics list' })

-- Telescope keymaps
function vim.getVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg 'v'
  vim.fn.setreg('v', {})

  text = string.gsub(text, '\n', '')
  if #text > 0 then
    return text
  else
    return ''
  end
end

vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = '[F]ind [O]ld files' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').live_grep, { desc = '[F]ind in [D]irectory' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind [W]ord' })
vim.keymap.set('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = 'Find in buffer' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').spell_suggest, { desc = '[S]pell [S]uggess' })
vim.keymap.set('n', '<leader>mh', '<Cmd>Telescope noice<CR>', { desc = '[M]essage [H]istory' })
vim.keymap.set('n', '<leader>u', '<Cmd>Telescope undo<CR>', { desc = '[U]ndo Tree' })
vim.keymap.set('n', '<leader>ft', '<Cmd>TodoTelescope<CR>', { desc = '[F]ind [T]o dos' })

vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope file_browser<CR>', { desc = '[F]ile [B]rowser' })

vim.keymap.set('v', '<leader>fd', function()
  local text = vim.getVisualSelection()
  require('telescope.builtin').live_grep { default_text = text }
end, { desc = '[F]ind in [D]irectory' })

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
