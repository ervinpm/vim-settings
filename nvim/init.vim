syntax on
filetype plugin indent on

set exrc
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set clipboard=unnamedplus
set tabstop=4 softtabstop=4
set relativenumber
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set hidden
set noerrorbells
set nu
set nowrap
set smartcase
set noswapfile 
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
" set colorcolumn=80
set cursorline
let mapleader = "," "map leader to comma

if &term == "alacritty"        
  let &term = "xterm-256color"
endif

" cursor for windows terminal
if &term =~ '^xterm'
  let &t_EI .= "\<Esc>[2 q"
  let &t_SI .= "\<Esc>[6 q"
endif

" controlp
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

call plug#begin(stdpath('data') . '/plugged')

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mtdl9/vim-log-highlighting'
Plug 'martinda/jenkinsfile-vim-syntax'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'

" Telescope stuff
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'

" java LSP
Plug 'mfussenegger/nvim-jdtls'

" Auto Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
call plug#end()

" needs to have one dark theme plubin installed first
colorscheme onedark

" NERD Tree Configuration
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>r :NERDTreeFind<CR>
nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>i <cmd>lua require'telescope.builtin'.find_files { cwd = '~/.config/nvim', file_ignore_patterns = { "^undodir/" } }<cr>

" lua configurations
lua require('lsp-config')
lua require('cmp-config')
lua require('treesitter-config')

" java lsp
augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'jdtls_setup'.setup()
augroup end

