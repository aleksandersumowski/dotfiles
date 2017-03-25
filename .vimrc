set nocompatible               " be iMproved
" for langserv
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['cargo', 'run', '--release', '--manifest-path=/opt/rls/Cargo.toml'],
    \ 'javascript': ['/usr/local/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'javascript.jsx': ['/usr/local/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

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
set inccommand=split
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
let g:deoplete#enable_at_startup = 1
let g:vim_json_syntax_conceal = 0

"vim command completion
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.so,*.swp,*.class,**/.sass-cache/**
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

"testing
set showcmd

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

" keyboard shortcuts
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l
map <C-o> :Files<CR>
map <C-i> :Buffers<CR>

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
let g:python_host_skip_check = 1
autocmd VimResized * :wincmd =

call plug#begin()
Plug 'L9'
Plug 'scrooloose/nerdtree'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elzr/vim-json'
Plug 'derekwyatt/vim-scala'
Plug 'elixir-lang/vim-elixir'
Plug 'sjl/gundo.vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'paredit.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'jisaacks/GitGutter'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rsi'
Plug 'altercation/vim-colors-solarized'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'vim-syntastic/syntastic'
call plug#end()

set background=dark
colorscheme solarized


autocmd BufNewFile,BufRead *.cljx set ft=clojure
autocmd BufNewFile,BufRead *.cljc set ft=clojure
autocmd BufNewFile,BufRead *.boot set ft=clojure
autocmd BufNewFile,BufRead *.elm set ft=elm
autocmd BufNewFile,BufRead riemann.config set ft=clojure
