vim.o.number = true
vim.o.hlsearch = false
vim.o.scrolloff = 5
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.smartcase = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

vim.keymap.set("n", "zc", function()
	require("vscode-neovim").call("editor.fold")
end)
vim.keymap.set("n", "zo", function()
	require("vscode-neovim").call("editor.unfold")
end)
vim.keymap.set("n", "<leader>ca", function()
	require("vscode-neovim").call("editor.action.quickFix")
end)
vim.keymap.set("n", "<leader>rn", function()
	require("vscode-neovim").call("editor.action.rename")
end)
vim.keymap.set("n", "]d", function()
	require("vscode-neovim").call("editor.action.marker.next")
end)
vim.keymap.set("n", "[d", function()
	require("vscode-neovim").call("editor.action.marker.prev")
end)
vim.keymap.set("n", "gr", function()
	require("vscode-neovim").call("references-view.findReferences")
end)

require("lazy").setup({
	{
		"tpope/vim-surround",
		event = "BufEnter",
	},
})
