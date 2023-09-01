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
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
	},
}

M.custom = {
	n = {
		["<leader>pf"] = { ":Telescope find_files <CR>", "Telescope find files" },
		["gr"] = {
			function()
				require("telescope.builtin").lsp_references()
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
		["<leader>/"] = { ":Telescope live_grep<CR>", "Search keywords in project" },
		["<leader>bi"] = { ":Telescope buffers<CR>", "Search buffers" },
		["<leader>gg"] = { ":LazyGit<CR>", "Lazygit" },
	},
	v = {
		["<"] = { "<gv" },
		[">"] = { ">gv" },
	},
}

-- more keybinds!

return M
