so ~/.config/nvim/plugins.vim
lua require('init')
" Install extensions for web-development
" :CocInstall coc-tsserver coc-json coc-html coc-css coc-prettier
" Install bat and ripgrep for full fzf features

" Map leader key to space
let mapleader = " "

" Airline
" Show buffer tab
" let g:airline#extensions#tabline#enabled=1
let g:airline_theme='ayu_dark'

" Change vimiki to markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" Color Scheme
set termguicolors
let g:rehash256 = 1
let g:gruvbox_contrast_dark='hard'
let g:tokyonight_style = "night"
set background=dark
let ayucolor="dark"
colorscheme tokyonight
" Transparent background
" highlight Normal guibg=NONE ctermbg=NONE

set expandtab
set nu
set noshowmode
set laststatus=2
set wildignorecase
set relativenumber

" Keybinds
" Insert mode
" Bind esc key to kj"
inoremap kj <Esc>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Normal mode
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
nnoremap <C-a> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>p :Prettier<CR>
nnoremap <Leader>s :update<CR>

" lua << EOF
" require'nvim-treesitter.configs'.setup {
"   -- A list of parser names, or "all"
"   ensure_installed = { "javascript", "typescript", "haskell" },

"   -- Install parsers synchronously (only applied to `ensure_installed`)
"   sync_install = false,

"   -- Automatically install missing parsers when entering buffer
"   auto_install = true,

"   -- List of parsers to ignore installing (for "all")
"   ignore_install = {},

"   ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
"   -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

"   highlight = {
"     -- `false` will disable the whole extension
"     enable = true,

"     -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
"     -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
"     -- the name of the parser)
"     -- list of language that will be disabled
"     disable = {},

"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
" }
" EOF
