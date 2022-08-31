call plug#begin()

Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
"Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
" Plug 'sheerun/vim-polyglot'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'nvim-lua/plenary.nvim'

" Color Schemes
Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()


