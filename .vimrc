syntax on
filetype plugin indent on

set exrc
set guicursor=
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
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
" set colorcolumn=80
colo default

if &term == "alacritty"        
  let &term = "xterm-256color"
endif
