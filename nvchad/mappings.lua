---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		["<leader>h"] = "",
		["<leader>b"] = "",
		["<C-n>"] = "",
	},
}

M.general = {
	n = {
		-- [";"] = { ":", "enter command mode", opts = { nowait = true } },
	},
}

M.custom = {
	n = {
		["<leader>pf"] = {
			function()
				require("telescope.builtin").find_files()
			end,
			"Telescope find files",
		},
		["<leader>/"] = {
			function()
				require("telescope.builtin").live_grep()
			end,
			"Search keywords in project",
		},
		["<leader>bi"] = {
			function()
				require("telescope.builtin").buffers()
			end,
			"Search buffers",
		},
		["gr"] = {
			function()
				require("telescope.builtin").lsp_references()
			end,
			"[G]oto [R]eferences",
		},
		["<C-LeftMouse>"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"[G]oto [R]eferences",
		},
		["<leader>rn"] = {
			function()
				require("nvchad.renamer").open()
			end,
			"LSP rename",
		},
		["<leader>op"] = { ":NvimTreeToggle <CR>", "Toggle nvim tree" },
		["<leader>oP"] = { ":NvimTreeFocus <CR>", "Focus nvim tree" },
		["<leader>gg"] = { ":LazyGit<CR>", "Lazygit" },
		["<leader>e"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},
	},
	v = {
		["<"] = { "<gv" },
		[">"] = { ">gv" },
	},
}

-- more keybinds!

return M
