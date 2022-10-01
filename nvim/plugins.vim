call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'mfussenegger/nvim-dap'
Plug 'glepnir/dashboard-nvim'
" Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'folke/which-key.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'rcarriga/nvim-dap-ui'

" Color Schemes
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/everforest'
Plug 'gruvbox-community/gruvbox'
Plug 'EdenEast/nightfox.nvim'

call plug#end()
