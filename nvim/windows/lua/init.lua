require("options")
require("config.treesitter")
require("config.lsp")
require("config.lspsaga")
require("config.cmp")
require("config.nvimtree")
require("config.lualine")
require("config.dashboard")
require("config.null-ls")
require("nvim-autopairs").setup()
require("telescope").setup({
	defaults = {
		path_display = {
			truncate = 3,
		},
	},
})
require("keybindings")
-- require('bufferline').setup()
