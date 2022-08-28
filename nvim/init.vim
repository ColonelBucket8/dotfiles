so ~/.config/nvim/plugins.vim
so ~/.config/nvim/coc.vim
" Install extensions for web-development
" :CocInstall coc-tsserver coc-json coc-html coc-css coc-prettier
" Install bat and ripgrep for full fzf features

" Map leader key to space
let mapleader = " "

" Airline
" Show buffer tab
" let g:airline#extensions#tabline#enabled=1

" Change vimiki to markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" Color Scheme
set termguicolors
let g:rehash256 = 1
let g:gruvbox_contrast_dark='hard'
" let g:airline_theme='palenight'
let g:tokyonight_style = "night"
set background=dark
let ayucolor="dark"
colorscheme ayu
" Transparent background
" highlight Normal guibg=NONE ctermbg=NONE

set expandtab
set nu
set noshowmode
set laststatus=2
set wildignorecase
set relativenumber

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
