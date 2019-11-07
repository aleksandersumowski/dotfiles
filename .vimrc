"vim command completion
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set completeopt-=preview
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
let maplocalleader = ','
let g:strip_whitespace_on_save = 1
let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'
let g:python3_host_prog=$HOME.'/.pythons/neovim/bin/python3'
"let g:conjure_log_direction="horizontal"
""let g:coc_global_extensions = ['coc-conjure']
let g:deoplete#enable_at_startup = 1

let g:iced_enable_default_key_mappings = v:true


map <C-i> :GFiles<CR>
map <C-b> :Buffers<CR>
map <C-p> :FZFMru<CR>
nmap <leader>a :Rg 


"nmap <C-i> :Clap git_files<CR>
"nmap <C-b> :Clap buffers<CR>
"nmap <C-p> :Clap history<CR>

"nmap <leader>l :Clap blines<CR>
"nmap <leader>a :Clap grep<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

function! FormatJSON()
    :%!python -m json.tool
endfunction

call plug#begin()
"Plug 'eraserhd/parinfer-rust'
"Plug 'liuchengxu/vim-clap'
Plug 'guns/vim-sexp'
Plug 'dense-analysis/ale'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liquidz/vim-iced'
Plug 'jiangmiao/auto-pairs'
Plug 'liquidz/vim-iced-kaocha'
Plug 'liquidz/vim-iced-coc-source'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/paredit.vim'
"Plug 'Olical/conjure', { 'tag': 'v2.1.0', 'do': 'bin/compile', 'for': 'clojure', 'on': 'ConjureAdd'  }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'SirVer/ultisnips'

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

Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'simnalamburt/vim-mundo'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'

" specific languages/data formats
Plug 'chrisbra/csv.vim'
Plug 'elzr/vim-json'
Plug 'hashivim/vim-terraform'
"Plug 'kovisoft/paredit'
call plug#end()

colorscheme gruvbox

autocmd BufNewFile,BufRead *.cljx set ft=clojure
autocmd BufNewFile,BufRead *.cljc set ft=clojure
autocmd BufNewFile,BufRead *.boot set ft=clojure
autocmd BufNewFile,BufRead *.elm set ft=elm
autocmd BufNewFile,BufRead riemann.config set ft=clojure
autocmd BufNewFile,BufRead *.conf set ft=nginx
