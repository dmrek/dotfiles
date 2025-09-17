syntax on

set clipboard^=unnamed,unnamedplus
set incsearch
set hlsearch
set ignorecase smartcase
set number
set relativenumber
set scrolloff=5
set shiftwidth=4 smarttab
set expandtab

let mapleader=' '
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Down> <NOP>
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap uh :noh<CR>

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'

call plug#end()
