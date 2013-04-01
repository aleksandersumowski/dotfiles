if $TMUX == ''
        set clipboard+=unnamed
endif
set nocompatible               " be iMproved
set nu
filetype off                   " required!

set expandtab

set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set scrolloff=5
set hlsearch
set incsearch

let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 1000
let g:fuf_mrucmd_maxItem = 400
let g:fuf_mrufile_exclude = '\v\~$|\.(bak|sw[po])$|^(\/\/|\\\\|\/mnt\/)'
nnoremap <silent> <C-j>      :FufMruFile<CR>
nnoremap <silent> <C-h>      :FufCoverageFile<CR>
nnoremap <silent> <C-z>      :FufTag<CR>

set laststatus=2  "always display status line
set statusline=%{fugitive#statusline()}%F

"persistent undo
"if !isdirectory("~/.vim")
"    call mkdir("~/.vim", "p")
"    call mkdir("~/.vim/undodir", "p")
"    call mkdir("~/.vim/backup", "p")
"    call mkdir("~/.vim/swapfiles", "p")
"endif

set undodir=~/.vim/undodir
set backupdir=~/.vim/backup
set directory=~/.vim/swapfiles
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'derekwyatt/vim-scala'
Bundle 'fholgado/minibufexpl.vim.git'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'guns/vim-clojure-static'
Bundle 'jboyens/vim-stringtemplate'
Bundle 'jcf/vim-latex'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-foreplay'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

filetype plugin indent on     " required! 
filetype on
syntax enable
set background=dark
colorscheme solarized
