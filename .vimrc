set nocompatible               " be iMproved
syntax enable

set autoindent
set expandtab
set hlsearch
set clipboard+=unnamedplus                                        " yank and paste with the system clipboard
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
let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'
let g:paredit_electric_return = 0
let g:paredit_smartjump = 1

"vim command completion
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.so,*.swp,*.class,**/.sass-cache/**
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

"testing
set showcmd

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

" keyboard shortcuts
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l
map <C-o> :CtrlPBuffer<CR>
map <C-i> :CtrlPMRU<CR>

set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swapfiles//
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

let mapleader = ','
nnoremap S diw"0P
nnoremap <leader>R :%s/\s\+$//<cr>:let @/=''<CR>
nmap <leader>a :Ag 
nmap <leader>g :GundoToggle<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>r :Require<CR>
nmap <leader>e :Eval<CR>
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

let g:ackprg = 'ag --nogroup --column'
let g:paredit_smartjump = 1
autocmd VimResized * :wincmd =

call plug#begin()
Plug 'gmarik/Vundle.vim'
Plug 'lambdatoast/elm.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'elzr/vim-json'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rodjek/vim-puppet'
Plug 'L9'
Plug 'paredit.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fholgado/minibufexpl.vim'
Plug 'guns/vim-clojure-static'
Plug 'jisaacks/GitGutter'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go'
call plug#end()

set background=dark
colorscheme solarized


autocmd BufNewFile,BufRead *.cljx set ft=clojure
autocmd BufNewFile,BufRead *.cljc set ft=clojure
autocmd BufNewFile,BufRead *.boot set ft=clojure
autocmd BufNewFile,BufRead *.elm set ft=elm
autocmd BufNewFile,BufRead riemann.config set ft=clojure
