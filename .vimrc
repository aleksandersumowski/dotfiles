set nocompatible               " be iMproved
filetype off                   " required!

syntax enable

set autoindent
set expandtab
set hlsearch
set clipboard=unnamed                                        " yank and paste with the system clipboard
set encoding=utf-8
set ignorecase                                               " case-insensitive search
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set ruler                                                    " show where you are
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set incsearch
set laststatus=2  "always display status line
set number                    " line numbers
set scrolloff=5
set softtabstop=2
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set smartcase                                                " case-sensitive search if any caps
set statusline=%{fugitive#statusline()}%F
set tabstop=8
set textwidth=79

"vim command completion
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.so,*.swp,*.class
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"testing
set showcmd

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set undodir=~/.vim/undodir
set backupdir=~/.vim/backup
set directory=~/.vim/swapfiles
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

let mapleader = ','
nnoremap S diw"0P
nmap <leader>a :Ag
nmap <leader>g :GundoToggle<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>r :Require<CR>
nmap <leader>e :Eval<CR>



let g:ackprg = 'ag --nogroup --column'
let g:gitgutter_enabled = 0
let g:paredit_smartjump = 1
autocmd VimResized * :wincmd =

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'paredit.vim'
Bundle 'nanki/treetop.vim'
Bundle 'jgdavey/tslime.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
Bundle 'derekwyatt/vim-scala'
Bundle 'fholgado/minibufexpl.vim.git'
Bundle 'guns/vim-clojure-static'
Bundle 'jisaacks/GitGutter'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/Align'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on
filetype on
set background=dark
colorscheme solarized
