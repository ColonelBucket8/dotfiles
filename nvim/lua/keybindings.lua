vim.g.mapleader = ' '
local keymap = vim.keymap.set
local cmd = vim.cmd

-- Normal mode
-- File
keymap('n', '<Leader>fs', "<Cmd>update<CR>")

-- Project
keymap('n', '<Leader>pf', "<Cmd>Files<CR>")
keymap('n', '<Leader>ps', "<Cmd>Rg<CR>")
keymap('n', '<Leader>pg', "<Cmd>GFiles<CR>")

-- Open
keymap('n', '<Leader>op', "<Cmd>NvimTreeToggle<CR>")
keymap('n', '<Leader>oP', "<Cmd>NvimTreeFindFile<CR>")
keymap('n', '<Leader>of', "<Cmd>NvimTreeFocus<CR>")
keymap('n', '<Leader>ot', "<Cmd>term zsh<CR>")

-- Search
keymap('n', '<Leader>sc', "<Cmd>Commands<CR>")
keymap('n', '<Leader>sn', "<Cmd>Files ~/.config/nvim<CR>")
keymap('n', '<Leader>sh', "<Cmd>History<CR>")

-- Code
keymap('n', '<Leader>cp', "<Cmd>PrettierAsync<CR>")

-- Buffer
keymap('n', '<Leader>bl', "<Cmd>Buffers<CR>")
keymap('n', '<Leader>bd', "<Cmd>bd<CR>")
keymap('n', '<Leader>bn', "<Cmd>bn<CR>")
keymap('n', '<Leader>bp', "<Cmd>bp<CR>")

-- Git
keymap('n', '<Leader>gd', "<Cmd>Gvdiffsplit<CR>")
keymap('n', '<Leader>gh', "<Cmd>Git<CR>")
keymap('n', '<Leader>gp', "<Cmd>Git push<CR>")
keymap('n', '<Leader>gr', ":GRename<Space>")
keymap('n', '<Leader>gb', "<Cmd>Git blame<CR>")

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

-- Terminal mode
cmd([[
tnoremap kj <C-\><C-n>
]])
