syntax on
filetype plugin indent on

set exrc
set guicursor=
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
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
" set colorcolumn=80
set noeb
set novb
set belloff=all
let mapleader = "," "map leader to comma

if &term == "alacritty"        
  let &term = "xterm-256color"
endif

" cursor for windows terminal
if &term =~ '^xterm'
  let &t_EI .= "\<Esc>[2 q"
  let &t_SI .= "\<Esc>[6 q" 
endif

" tmux cursor changes
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" controlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

call plug#begin()

Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

colorscheme onedark
