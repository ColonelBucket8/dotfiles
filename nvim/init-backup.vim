so ~/.config/nvim/plugins.vim
so ~/.config/nvim/coc.vim

syntax enable
set background=dark
let g:gruvbox_contrast_dark='hard'
set termguicolors
let ayucolor="dark"
colorscheme ayu

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=2
set nu
set noshowmode
set laststatus=2
set incsearch 
set hlsearch
set autoread
set hidden
set wildmenu
set wildignorecase
set relativenumber

inoremap kj <Esc>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <C-a> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
