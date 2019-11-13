let g:python3_host_prog=$HOME.'/.pythons/neovim/bin/python3'
let mapleader = '\<space>'
let maplocalleader = ','
let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'

set clipboard+=unnamedplus                                        " yank and paste with the system clipboard
set hidden " hide abandoned buffers instead of unloading
set mouse=a
set number                    " line numbers
set scrolloff=5
set termguicolors

"white chars
set list " show trailing whitespace
set listchars=tab:▸\ ,trail:▫

"tabbing
set softtabstop=2
set tabstop=8 expandtab smarttab
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces

"completion
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.so,*.swp,*.class,**/.sass-cache/**
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=list:longest,full
set wildchar=<tab>
set completeopt-=preview

"searching
set hlsearch
set ignorecase                                               " case-insensitive search
set smartcase                                                " case-sensitive search if any caps
set inccommand=split
set incsearch

nmap <C-i> :GFiles<CR>
nmap <C-b> :Buffers<CR>
nmap <C-p> :FZFMru<CR>
nmap <localleader>a :Rg 


nmap <localleader>d :NERDTreeToggle<CR>
nmap <localleader>f :NERDTreeFind<CR>
let g:conjure_log_direction = "horizontal"
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file", "eval"]
let g:AutoPairsFlyMode = 1

function! FormatJSON()
    :%!python -m json.tool
endfunction


call plug#begin()
"Plug 'eraserhd/parinfer-rust'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'Olical/conjure', { 'tag': '*', 'do': 'bin/compile', 'for': 'clojure', 'on': 'ConjureAdd'  }
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'

Plug 'tpope/vim-abolish' " coercion camel/snake/etc
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'simnalamburt/vim-mundo'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
call plug#end()

colorscheme gruvbox
