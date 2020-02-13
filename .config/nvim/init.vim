" leader key
let mapleader = ","

" plugins go here
if has("nvim")
    call plug#begin('~/.local/share/nvim/plugged')

    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-commentary'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-entire'
    Plug 'Valloric/YouCompleteMe'
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
    Plug 'jceb/vim-orgmode'
    Plug 'sheerun/vim-polyglot'

    call plug#end()
endif

" colorscheme for my status bar
let g:lightline = { 'colorscheme': 'one', }

" configs for YCM plugin
let g:ycm_global_ycm_extra_conf = '~/.config/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_autoclose_preview_window_after_completion = 1

set nocompatible             " disable vi compatibility
set nowrap                   " don't wrap my lines
set clipboard=unnamedplus    " use clipboard as your default buffer
set incsearch                " search while I'm typing
set number                   " line numbers
set mouse=a                  " mouse support
set wildmenu                 " command mode autocomplete
set encoding=utf-8           " unicode!!
set showcmd                  " show the part of the command being typed
set noshowmode               " since I have lightline
set nohlsearch               " don't highlight search results
set splitbelow splitright    " sane settings for where the new pane goes 
set showmatch                " highlight matching brackets
set noswapfile               " don't create .swp files
set undofile                 " remember undo tree between sessions
let loaded_matchparen = 1
syntax on                    " highlight syntax

" indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" some bindings
nnoremap ;  :
nnoremap s  :!
nnoremap S  :%s//g<left><left>
nnoremap gn :tabnew<cr>
nnoremap <backspace> "_
nnoremap <down> g<down>
nnoremap <up> g<up>
nnoremap j gj
nnoremap k gk

" swapping lines
" does not properly work on first/last line
nnoremap <c-down> "ddd"dp
nnoremap <c-up>   "dddk"dP
imap <c-down> <esc><c-down>i
imap <c-up>   <esc><c-up>i

" save on Ctrl-S
nnoremap <c-s> :w<cr>
inoremap <c-s> <c-o>:w<cr>
vnoremap <c-s> <c-c>:w<cr>

" split panes
hi VertSplit cterm=NONE
nnoremap \|       :vnew<cr>
nnoremap <bslash> :new<cr>
nnoremap <m-w>    <c-w>

" indenting
vnoremap > >gv
vnoremap < <gv
vmap <tab> >
vmap <s-tab> <
nnoremap <tab> >>
nnoremap <s-tab> <<

" leader utilization
nnoremap <leader>f :FZF<cr>
nnoremap <leader>t :terminal<cr>:setlocal number!<cr>i

" autocomplete braces
inoremap {<cr> {<cr>}<esc>ko

" terminal mode
tnoremap <esc> <c-\><c-n>

" undo/redo
nnoremap U <c-r>

" reload apps when configs are edited - consider switching to entr
autocmd BufWritePost ~/.config/i3/config !i3-msg reload
autocmd BufWritePost ~/.config/i3blocks/config !i3-msg restart
autocmd BufWritePost ~/.Xresources !xrdb %
autocmd BufWritePost ~/.config/nvim/init.vim source %

" template files
autocmd BufNewFile *.c   0r ~/.config/nvim/templates/empty.c
autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/empty.cpp
autocmd BufNewFile *.py  0r ~/.config/nvim/templates/empty.py
autocmd BufNewFile *.sh  0r ~/.config/nvim/templates/empty.sh

" make scripts executable
autocmd BufWritePost *.py silent !chmod u+x %
autocmd BufWritePost *.sh silent !chmod u+x %

