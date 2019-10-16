"vim command completion
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backupdir=~/.vim/backup//
set clipboard+=unnamedplus                                        " yank and paste with the system clipboard
set directory=~/.vim/swapfiles//
set expandtab
set hidden
set hlsearch
set ignorecase                                               " case-insensitive search
set inccommand=split
set incsearch
set laststatus=2  "always display status line
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set mouse=a
set number                    " line numbers
set ruler                                                    " show where you are
set scrolloff=5
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2
set statusline=%{fugitive#statusline()}%F
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set undodir=~/.vim/undo//
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.so,*.swp,*.class,**/.sass-cache/**
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

let mapleader = ','
let g:strip_whitespace_on_save = 1
let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'
let g:python3_host_prog=$HOME.'/.pythons/neovim/bin/python3'

map <C-i> :GFiles<CR>
map <C-o> :Buffers<CR>
map <C-p> :FZFMru<CR>


nmap <leader>a :Grepper -tool rg -noprompt -query 
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>r :Require<CR>
nmap <leader>e :Eval<CR>

let g:ackprg = 'rg --vimgrep --no-heading'

function! FormatJSON()
    :%!python -m json.tool
endfunction

let g:grepper = { 'tools': ['rg', 'git'], }



call plug#begin()
Plug 'eraserhd/parinfer-rust'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'Olical/conjure', { 'tag': 'v2.0.0', 'do': 'bin/compile', 'for': 'clojure', 'on': 'ConjureAdd'  }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
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

Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'simnalamburt/vim-mundo'
Plug 'morhetz/gruvbox'

" specific languages/data formats
Plug 'chrisbra/csv.vim'
Plug 'elzr/vim-json'
Plug 'hashivim/vim-terraform'
call plug#end()

set background=dark
colorscheme gruvbox

autocmd BufNewFile,BufRead *.cljx set ft=clojure
autocmd BufNewFile,BufRead *.cljc set ft=clojure
autocmd BufNewFile,BufRead *.boot set ft=clojure
autocmd BufNewFile,BufRead *.elm set ft=elm
autocmd BufNewFile,BufRead riemann.config set ft=clojure
autocmd BufNewFile,BufRead *.conf set ft=nginx
