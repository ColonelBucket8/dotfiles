vim.g.mapleader = ' '
local keymap = vim.keymap.set

-- Normal mode
-- File
keymap('n', '<Leader>fs', "<Cmd>update<CR>")

-- Project
keymap('n', '<Leader>pf', "<Cmd>Files<CR>")
keymap('n', '<Leader>ps', "<Cmd>Rg<CR>")
keymap('n', '<Leader>pg', "<Cmd>GFiles<CR>")

-- Open
keymap('n', '<Leader>os', "<Cmd>NvimTreeToggle<CR>")
keymap('n', '<Leader>oc', "<Cmd>NvimTreeFindFile<CR>")
keymap('n', '<Leader>of', "<Cmd>NvimTreeFocus<CR>")
keymap('n', '<Leader>ot', "<Cmd>term<CR>")

-- Search
keymap('n', '<Leader>sc', "<Cmd>Commands<CR>")

-- Code
keymap('n', '<Leader>cp', "<Cmd>PrettierAsync<CR>")

-- Buffer
keymap('n', '<Leader>bf', "<Cmd>Buffers<CR>")
keymap('n', '<Leader>bd', "<Cmd>bd<CR>")

-- Git
keymap('n', '<Leader>gd', "<Cmd>Gvdiffsplit<CR>")

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
