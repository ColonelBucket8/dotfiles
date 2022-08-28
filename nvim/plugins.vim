call plug#begin()

Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
"Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'

" Color Schemes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()


