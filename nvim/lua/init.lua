require('config.tokyonight')
require('options')
require('config.treesitter')
require('config.lsp')
require('config.lspsaga')
require('config.cmp')
require('nvim-tree').setup()
require('config.lualine')
require('config.dap')
require('config.dashboard')
-- require('null-ls').setup({
--   sources = {
--     require('null-ls').builtins.formatting.prettier
--   }
-- })
-- require('which-key').setup()
require('keybindings')
