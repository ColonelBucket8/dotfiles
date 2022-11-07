local opt = vim.opt
local cmd = vim.cmd

vim.g.mapleader = ' '

opt.expandtab = true
opt.nu = true
opt.showmode = false
opt.laststatus = 2
opt.wildignorecase = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 0
opt.scrolloff = 10

-- Color Scheme
opt.termguicolors = true
vim.g.gruvbox_contrast_dark = "hard"
opt.background = "dark"
cmd([[ 
colorscheme tokyonight 
hi LineNr guifg=#41a6b5
]])

-- Vimwiki
cmd([[
let g:vimwiki_list = [{'path': '~/vimwiki/', 
                      \ 'syntax': 'markdown', 'ext': '.md'}]
]])
