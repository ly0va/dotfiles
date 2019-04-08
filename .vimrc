set nocompatible             " disable vi compatibility
set nowrap                   " don't wrap my lines
set clipboard=unnamedplus    " use clipboard as your default buffer
set incsearch                " search while I'm typing
set number                   " line numbers
set mouse=a                  " mouse support
set wildmenu                 " command mode autocomplete
set encoding=utf-8           " unicode!!
syntax on                    " highlighting

" indenting
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" ranger-like binding
nmap ; :

" save on Ctrl-S
nmap <c-s> :w<CR>
imap <c-s> <c-o>:w<CR>
vmap <c-s> <c-c>:w<CR>

