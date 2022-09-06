vim.g.mapleader = ' '
local keymap = vim.keymap.set

-- Normal mode
keymap('n', '<Leader>s', "<Cmd>update<CR>")
keymap('n', '<C-a>', "<Cmd>NvimTreeToggle<CR>")
keymap('n', '<C-f>', "<Cmd>NvimTreeFindFile<CR>")
keymap('n', '<C-p>', "<Cmd>Files<CR>")
keymap('n', '<Leader>f', "<Cmd>Rg<CR>")
keymap('n', '<Leader>p', "<Cmd>PrettierAsync<CR>")

-- Insert mode
keymap('i', 'kj', "<Esc>")
keymap('i', '"', '""<left>')
keymap('i', "'", "''<left>")
keymap('i', '`', "``<left>")
keymap('i', '(', "()<left>")
keymap('i', '[', "[]<left>")
keymap('i', '{', "{}<left>")
keymap('i', '{<CR>', "{<CR>}<ESC>O")
keymap('i', '{;<CR>', "{<CR>};<ESC>O")
