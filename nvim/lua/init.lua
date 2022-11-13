require("config.tokyonight")
require("options")
require("config.treesitter")
require("mason").setup()
require("mason-lspconfig").setup()
-- require("lspconfig").setup()
require("config.lsp")
require("config.lspsaga")
require("config.cmp")
require("config.lualine")
require("config.nvimtree")
require("config.dap")
require("config.dashboard")
require("nvim-autopairs").setup()
require("config.dapui")
require("nvim-dap-virtual-text").setup()
require("config.null-ls")
require("telescope").setup({
	defaults = {
		path_display = {
			truncate = 3,
		},
	},
})
require("keybindings")
