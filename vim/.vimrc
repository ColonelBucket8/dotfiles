so ~/.vim/plugins.vim
so ~/.vim/coc.vim
" Install extensions for web-development
" :CocInstall coc-tsserver coc-json coc-html coc-css

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=2
set nu
set noshowmode
set laststatus=2
set incsearch

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
