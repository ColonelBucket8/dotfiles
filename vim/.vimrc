so ~/.vim/plugins.vim
so ~/.vim/coc.vim

" Coc path for windows
let g:coc_data_home = 'C:\\Users\\freed\\.config\\coc'

" Install extensions for web-development
" :CocInstall coc-tsserver coc-json coc-html coc-css coc-prettier
" Install bat and ripgrep for full fzf features
" Color Scheme
syntax enable
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
"highlight LineNr ctermfg=blue

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nu
set noshowmode
set laststatus=2
set incsearch
set hlsearch

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

nnoremap <C-f> :NERDTreeToggle<CR>:NERDTreeMirror<CR>

