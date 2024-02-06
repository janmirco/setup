syntax enable

set noerrorbells

set encoding=utf-8
set fileencoding=utf-8

set splitbelow
set splitright

set number
set norelativenumber

set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab
set smarttab
set autoindent
set smartindent
set foldmethod=manual
autocmd FileType * set formatoptions-=cro

set linebreak
set nowrap
set scrolloff=0
set sidescroll=0
set sidescrolloff=0
set noscrollbind

set nobackup
set nowritebackup
set noswapfile

set undodir=~/.vim/undodir
set undofile

set updatetime=50
set timeout
set timeoutlen=300

set showmatch
set incsearch
set nohlsearch

set showtabline=0
set tabpagemax=100

set autoread
set wildmenu
set showcmd
set path=.,/usr/include,,**

set mouse=a
set clipboard=unnamedplus
set laststatus=3
set conceallevel=2
