" highlighting
syntax on

" indenting
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" line numbers
set number

" mouse support
set mouse=a

" ranger-like binding
nmap ; :

" save on Ctrl-S
nmap <c-s> :w<CR>
imap <c-s> <c-o>:w<CR>
vmap <c-s> <c-c>:w<CR>

" don't wrap my lines
set nowrap

" use clipboard as your default buffer
set clipboard=unnamedplus
