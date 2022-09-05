so ~/.config/nvim/plugins.vim
lua require('init')
" Install extensions for web-development
" :CocInstall coc-tsserver coc-json coc-html coc-css coc-prettier
" Install bat and ripgrep for full fzf features

" Map leader key to space
" let mapleader = " "

" Airline
" Show buffer tab
" let g:airline#extensions#tabline#enabled=1
" let g:airline_theme='ayu_dark'

" Change vimiki to markdown
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]

" Color Scheme

" set termguicolors
" let g:rehash256 = 1
" let g:gruvbox_contrast_dark='hard'
" let g:tokyonight_style = "night"
" set background=dark
" let ayucolor="dark"
" colorscheme tokyonight
" Transparent background
" highlight Normal guibg=NONE ctermbg=NONE

" set expandtab
" set nu
" set noshowmode
" set laststatus=2
" set wildignorecase
" set relativenumber
" set tabstop=2
" set shiftwidth=0
         
" Keybinds
" Insert mode
" Bind esc key to kj"
" inoremap kj <Esc>
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ` ``<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" Normal mode
" nnoremap <C-j> :bn<CR>
" nnoremap <C-k> :bp<CR>
" nnoremap <C-a> :NvimTreeToggle<CR>
" nnoremap <silent> <C-f> :NvimTreeFindFile<CR>
" nnoremap <silent> <C-p> :Files<CR>
" nnoremap <silent> <Leader>f :Rg<CR>
" nnoremap <silent> <Leader>p :PrettierAsync<CR>
" nnoremap <Leader>s :update<CR>

" lua << EOF
" Put lua code here
" EOF
