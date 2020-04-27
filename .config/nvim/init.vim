" leader key
let mapleader = " "

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
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
    Plug 'sheerun/vim-polyglot'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'preservim/nerdtree'
    Plug 'mhinz/vim-startify'
    Plug 'jceb/vim-orgmode'
    Plug 'tpope/vim-endwise'
    " Plug 'rstacruz/vim-closer'
    Plug 'junegunn/goyo.vim'
    Plug 'tpope/vim-eunuch'
    Plug 'lyova-potyomkin/cfparser.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dracula/vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ap/vim-css-color'
    " Plug 'dense-analysis/ale'
    call plug#end()
endif

" codeforces settings
let g:cf_locale = "ru"

" startup screen
autocmd User Startified setlocal buftype=nofile
let g:startify_custom_header = []
let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 7
let g:startify_bookmarks = [ {'rc': '~/.vimrc'}, {'rgr': '~/.config/ranger/rc.conf'} ]
let g:startify_commands = [ 
   \ {'py': 'e empty.py'},
   \ {'c': 'e empty.c'}, 
   \ {'cpp': 'e empty.cpp'},
   \ {'cxx': 'e empty.cxx'},
   \ {'T' : ['terminal', 'execute "terminal" | setlocal number! | normal i']}
\ ]

" colorscheme setting
syntax on
set termguicolors
colo dracula
hi! normal guibg=NONE
source ~/.config/nvim/lightline-init.vim

" close vim if only nerdtree is left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" configs for YCM plugin
" let g:ycm_global_ycm_extra_conf = '~/.config/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_autoclose_preview_window_after_completion = 1
" coc configs
source ~/.config/nvim/coc-init.vim

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
set undolevels=100000        " remember a LOT of undos    
set scrolloff=2              " leave at least 2 lines above & below cursor
let loaded_matchparen = 1

" so that I don't have to switch layouts in normal mode
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" some sensible bindings
nnoremap U <c-r>
nnoremap cc "_cc
noremap ;  :
noremap gn :tabnew<cr>:Startify<cr>
noremap S  :%s//g<left><left>
noremap <backspace> "_
noremap <down> g<down>
noremap <up> g<up>
noremap j gj
noremap k gk
noremap Y y$
noremap Q <nop>

" swapping lines
nnoremap <c-down> :m .+1<CR>==
nnoremap <c-up>   :m .-2<CR>==
inoremap <c-down> <Esc>:m .+1<CR>==gi
inoremap <c-up>   <Esc>:m .-2<CR>==gi
vnoremap <c-down> :m '>+1<CR>gv=gv
vnoremap <c-up>   :m '<-2<CR>gv=gv

" save on Ctrl-S
nnoremap <c-s> :w<cr>
inoremap <c-s> <c-o>:w<cr>
vnoremap <c-s> <c-c>:w<cr>

" autoclosing {, because none of the plugins work for me
inoremap {<cr> {<cr>}<esc>O

" split panes
hi VertSplit cterm=NONE gui=NONE
nnoremap <silent> \|       :vnew<cr>:Startify<cr>
nnoremap <silent> <bslash> :new<cr>:Startify<cr>
noremap  <m-w>    <C-W>

" smart resizing
nmap          <m-w>+     <C-W>+<SID>ws
nmap          <m-w>-     <C-W>-<SID>ws
nmap          <m-w><     <C-W><<SID>ws
nmap          <m-w>>     <C-W>><SID>ws
nn <script>   <SID>ws+   <C-W>+<SID>ws
nn <script>   <SID>ws-   <C-W>-<SID>ws
nn <script>   <SID>ws<   <C-W><<SID>ws
nn <script>   <SID>ws>   <C-W>><SID>ws
nmap          <SID>ws    <Nop> 

" indenting
vnoremap > >gv
vnoremap < <gv
vmap <tab> >
vmap <s-tab> <
nnoremap <tab> >>
nnoremap <s-tab> <<

" leader utilization
noremap <leader>f :FZF<cr>
noremap <leader>t :terminal<cr>:setlocal number!<cr>i
noremap <leader>s :!
noremap <leader>m :MundoToggle<cr>
noremap <leader>n :NERDTreeToggle<cr>
noremap <silent> <leader>g :Goyo<cr>:hi VertSplit cterm=NONE gui=NONE<cr>
noremap <leader>rp :AsyncRun -save=1 -mode=term -rows=5 python %<cr>
noremap <leader>rr :AsyncRun -save=1 -mode=term -rows=5 cargo run<cr>
noremap <leader>rc :AsyncRun -save=1 -mode=term -rows=5 make %< && ./%<<cr>
noremap <leader>ra :AsyncRun -save=1 -mode=term -rows=5 

" compile and run things
map <F5> :AsyncRun -save=1 -mode=term -rows=5 ./%<cr>
map <F9> :AsyncRun -save=1 -mode=term -rows=5 make %< && ./%<<cr>

" terminal mode
tnoremap <esc> <c-\><c-n>

" reload apps when configs are edited - consider switching to entr
autocmd BufWritePost ~/.config/i3/config !i3-msg reload
autocmd BufWritePost ~/.config/i3blocks/config !i3-msg restart
autocmd BufWritePost ~/.Xresources !xrdb %
autocmd BufWritePost ~/.config/nvim/init.vim source %
autocmd BufWritePost ~/.vimrc source %

" template files
autocmd BufNewFile *.c      0r ~/.config/nvim/templates/empty.c
autocmd BufNewFile *.cpp    0r ~/.config/nvim/templates/empty.cpp
autocmd BufNewFile *.cxx    0r ~/.config/nvim/templates/empty.cxx
autocmd BufNewFile *.py     0r ~/.config/nvim/templates/empty.py
autocmd BufNewFile *.sh     0r ~/.config/nvim/templates/empty.sh

" make scripts executable
autocmd BufWritePost *.py silent !chmod u+x %
autocmd BufWritePost *.sh silent !chmod u+x %

