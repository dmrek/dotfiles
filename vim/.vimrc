syntax on

set clipboard=unnamed,unnamedplus

set nohlsearch
set incsearch
set ignorecase
set smartcase

" Auto-enable hlsearch when searching, disable after
augroup dynamic_hlsearch
  autocmd!
  autocmd CmdlineEnter /,\? set hlsearch
  autocmd CmdlineLeave /,\? set nohlsearch
augroup END

set history=5000

set number
set relativenumber

set scrolloff=8
set shiftwidth=4
set smarttab
set expandtab

let mapleader=' '
let maplocalleader=','
"      thirdleader='\'

xnoremap <leader>p "_dP

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz
nnoremap n nzzzv
nnoremap N Nzzzv

noremap <C-h> 40h
noremap <C-l> 40l

nmap <Up> <NOP>
nmap <Down> <NOP>
nmap <Left> <NOP>
nmap <Right> <NOP>

nmap Q <NOP>

noremap go o<Esc>
noremap gO O<Esc>
noremap U <C-r>

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'

call plug#end()
