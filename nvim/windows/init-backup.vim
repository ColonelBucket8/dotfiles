so ~/.config/nvim/plugins.vim
" so ~/.config/nvim/coc.vim
lua require('init')
" Install extensions for web-development
" :CocInstall coc-tsserver coc-json coc-html coc-css coc-prettier
" Install bat and ripgrep for full fzf features

" Prettier
" let g:prettier#autoformat_config_present = 1

" Change vimiki to markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Airline theme
let g:airline_theme='ayu_dark'

" Color Scheme
set termguicolors
set background=dark
let g:gruvbox_contrast_dark='hard'
let ayucolor="dark"
let g:tokyonight_style="night"
colorscheme tokyonight
" Transparent background
" autocmd VimEnter * hi Normal ctermbg=none
"highlight LineNr ctermfg=blue

" Map leader key to space
let mapleader = " "

set expandtab
set nu
set noshowmode
set laststatus=2
set wildignorecase
set relativenumber
set tabstop=2
set shiftwidth=0

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

nnoremap <C-j> :bn <CR>
nnoremap <C-k> :bp <CR>
nnoremap <C-a> :NvimTreeToggle<CR>
nnoremap <Leader>t :NvimTreeFocus<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :NvimTreeFindFile<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>p :PrettierAsync<CR>
nnoremap <Leader>s :update<CR>
