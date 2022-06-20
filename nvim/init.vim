call plug#begin()

" Gruvbox-material theme
Plug 'sainnhe/gruvbox-material'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter for Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Native LSP
Plug 'neovim/nvim-lspconfig'

" LSP Autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" NerdTree
Plug 'preservim/nerdtree'

" Rust Tools
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-lua/plenary.nvim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()

syntax on
set termguicolors
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noswapfile
set number
set clipboard=unnamedplus " unnamed for Windows

" Theme Configuration
colorscheme gruvbox-material
set background=dark
let g:gruvbox_material_better_performance = 1

lua require('init')

" Avoid showing extra messages when using completion
set shortmess+=c

let mapleader = " "

" NerdTree Keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
