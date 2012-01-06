set nocompatible               " be iMproved
set nu
filetype off                   " required!

set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
:syntax on
autocmd FileType python set omnifunc=pythoncomplete#Complete
set hlsearch
set incsearch

colorscheme wombat

let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=:dbname=smartdeals:extra=-t'
let g:dbext_default_profile = 'mysql_local'

let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 1000
let g:fuf_mrucmd_maxItem = 400
let g:fuf_mrufile_exclude = '\v\~$|\.(bak|sw[po])$|^(\/\/|\\\\|\/mnt\/)'
nnoremap <silent> <C-j>      :FufMruFile<CR>
nnoremap <silent> <C-a>      :FufCoverageFile<CR>
nnoremap <silent> <C-z>      :FufTag<CR>

set laststatus=2  "always display status line
set statusline=%{fugitive#statusline()}%F

"persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'klen/python-mode'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'fholgado/minibufexpl.vim.git'
 Bundle 'sjl/gundo.vim'

 " vim-scripts repos
 Bundle 'jbking/vim-pep8'
 Bundle 'L9'
 Bundle 'pyflakes.vim'
 Bundle 'dbext.vim'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required! 
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
