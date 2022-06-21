so ~/.vim/plugins.vim
so ~/.vim/coc.vim
so ~/.vim/ctrlp.vim

" Coc path for windows
let g:coc_data_home = 'C:\\Users\\freed\\.config\\coc'

" Ack config
let g:ackprg = 'rg --vimgrep --no-heading'

" Install extensions for web-development
" :CocInstall coc-tsserver coc-json coc-html coc-css coc-prettier
" Install bat and ripgrep for full fzf features

" Map leader key to space
let mapleader = " "

" Color Scheme
syntax enable
set background=dark
set termguicolors
let g:rehash256 = 1
"let g:gruvbox_contrast_dark='hard'
"let g:solarized_termcolors=256
let ayucolor="dark"
colorscheme ayu
colorscheme solarized
highlight LineNr ctermfg=yellow
"hi Normal guibg=NONE ctermbg=NONE
highlight Normal ctermbg=black

filetype plugin on
set nocompatible
set timeoutlen=1000
set ttimeoutlen=0
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

" Change cursor to line when in insert mode
" Block cursor by default 
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" ESC key
inoremap kj <Esc>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <C-a> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>p :Prettier<CR>
nnoremap <Leader>s :update<CR>
