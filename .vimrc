syntax on

set clipboard=unnamed
set incsearch
set hlsearch
set ignorecase smartcase
set history=5000
set number
set relativenumber
set scrolloff=5
set shiftwidth=4 smarttab
set expandtab
set vb

let mapleader=' '
let maplocalleader=','
"      thirdleader='\'

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz
noremap U <C-r>
noremap uh :noh<CR>

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'vim-airline/vim-airline'

call plug#end()
