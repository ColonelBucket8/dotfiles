local opt = vim.opt
local cmd = vim.cmd

opt.expandtab = true
opt.nu = true
opt.showmode = false
opt.laststatus = 2
opt.wildignorecase = true
opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 0

-- Color Scheme
opt.termguicolors = true
vim.g.tokyonight_style = "night"
opt.background = "dark"
cmd('colorscheme tokyonight')

-- Vimwiki
cmd([[
let g:vimwiki_list = [{'path': '~/vimwiki/', 
                      \ 'syntax': 'markdown', 'ext': '.md'}]
]])
