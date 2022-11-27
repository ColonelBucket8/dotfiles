if vim.g.vscode then
else
	vim.cmd("so ~/.config/nvim/plugins.vim")
	require("init")
end
