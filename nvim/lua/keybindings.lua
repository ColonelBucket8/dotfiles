local keymap = vim.keymap.set
local cmd = vim.cmd
vim.g.mapleader = ' '
local builtin = require("telescope.builtin")

-- Normal mode
-- File
keymap('n', '<Leader>fs', "<Cmd>update<CR>")
keymap('n', '<Leader>ff', "<Cmd>Files<CR>")

-- Project
-- keymap('n', '<Leader>pf', "<Cmd>Files<CR>")
-- keymap('n', '<C-p>', "<Cmd>Files<CR>")
-- keymap('n', '<Leader>ps', "<Cmd>Rg<CR>")
-- keymap('n', '<Leader>pg', "<Cmd>GFiles<CR>")
keymap("n", "<Leader>pf", builtin.find_files, {})
keymap("n", "<Leader>pg", builtin.live_grep, {})
keymap("n", "<Leader>pb", builtin.buffers, {})
keymap("n", "<Leader>ph", builtin.help_tags, {})
keymap("n", "<Leader>pc", builtin.commands, {})

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
-- keymap('n', '<Leader>cp', "<Cmd>PrettierAsync<CR>")
keymap('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end)

-- Buffer
keymap('n', '<Leader>bi', "<Cmd>Buffers<CR>")
keymap('n', '<Leader>bl', "<C-6>")
keymap('n', '<Leader>bd', "<Cmd>bd<CR>")
keymap('n', '<Leader>bn', "<Cmd>bn<CR>")
keymap('n', '<Leader>bp', "<Cmd>bp<CR>")

-- Git
keymap('n', '<Leader>gd', "<Cmd>Gvdiffsplit<CR>")
keymap('n', '<Leader>gg', "<Cmd>Git<CR>")
keymap('n', '<Leader>gp', "<Cmd>Git pull<CR>")
keymap('n', '<Leader>gP', "<Cmd>Git push<CR>")
keymap('n', '<Leader>gr', ":GRename<Space>")
keymap('n', '<Leader>gb', "<Cmd>Git blame<CR>")

-- Debugger
keymap('n', '<Leader>dd', "<Cmd>DapContinue<CR>")
keymap('n', '<Leader>db', "<Cmd>DapToggleBreakpoint<CR>")
keymap('n', '<Leader>di', "<Cmd>DapStepInto<CR>")
keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>")
keymap('n', '<Leader>dt', "<Cmd>DapTerminate<CR>")
keymap('n', '<Leader>do', "<Cmd>DapStepOver<CR>")
keymap('n', '<Leader>dO', "<Cmd>DapStepOut<CR>")

-- Help
keymap('n', '<Leader>hk', "<Cmd>view ~/.config/nvim/lua/keybindings.lua<CR>")

-- Insert mode
keymap('i', 'jj', "<Esc>")
-- keymap('i', '"', '""<left>')
-- keymap('i', "'", "''<left>")
-- keymap('i', '`', "``<left>")
-- keymap('i', '(', "()<left>")
-- keymap('i', '[', "[]<left>")
-- keymap('i', '{', "{}<left>")
-- keymap('i', '{<CR>', "{<CR>}<ESC>O")
-- keymap('i', '{;<CR>', "{<CR>};<ESC>O")

-- Terminal mode
cmd([[
tnoremap kj <C-\><C-n>
]])
