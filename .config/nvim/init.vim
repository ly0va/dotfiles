" leader key
let mapleader = ","

" plugins go here
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'Valloric/YouCompleteMe'

call plug#end()

" colorscheme for my status bar
let g:lightline = { 'colorscheme': 'one', }

" configs for YCM plugin
let g:ycm_global_ycm_extra_conf = '~/.config/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

set nocompatible             " disable vi compatibility
set nowrap                   " don't wrap my lines
set clipboard=unnamedplus    " use clipboard as your default buffer
set incsearch                " search while I'm typing
set number relativenumber    " line numbers, relative
set mouse=a                  " mouse support
set wildmenu                 " command mode autocomplete
set encoding=utf-8           " unicode!!
set showcmd                  " show the part of the command being typed
set noshowmode               " since I have lightline
set nohlsearch               " don't highlight search results
set splitbelow splitright    " sane settings for where the new pane goes 
syntax on                    " highlight syntax

" indenting
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" ranger-like bindings
nnoremap ;  :
nnoremap s  :!
nnoremap S  :%s//g<left><left>
nnoremap gn :tabnew<cr>

" save on Ctrl-S
nnoremap <c-s> :w<cr>
inoremap <c-s> <c-o>:w<cr>
vnoremap <c-s> <c-c>:w<cr>

" split panes
hi VertSplit cterm=NONE
nnoremap \|       :vnew<cr>
nnoremap <bslash> :new<cr>
nnoremap <m-w>    <c-w>

" leader utilization
nnoremap <leader>f :FZF<cr>
nnoremap <leader>t :terminal<cr>:setlocal number! relativenumber!<cr>i

" autocomplete braces
inoremap {<cr> {<cr>}<esc>ko

" terminal mode
tnoremap <esc> <c-\><c-n>

" reload apps when configs are edited - consider switching to entr
autocmd BufWritePost ~/.config/i3/config !i3-msg reload
autocmd BufWritePost ~/.config/i3blocks/config !i3-msg restart
autocmd BufWritePost ~/.Xresources !xrdb %
autocmd BufWritePost ~/.config/nvim/init.vim source %

