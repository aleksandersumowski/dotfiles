let g:python3_host_prog=$HOME.'/.pythons/neovim/bin/python3'
let g:python3_host_prog="/Users/aleksandersumowski/.pyenv/versions/3.9.0/bin/python3"
let mapleader = ','
let maplocalleader = ','
let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'
let g:paredit_smartjump = 1

set clipboard+=unnamedplus                                        " yank and paste with the system clipboard
set hidden " hide abandoned buffers instead of unloading
set undofile
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
"set completeopt-=preview

"searching
set hlsearch
set ignorecase                                               " case-insensitive search
set smartcase                                                " case-sensitive search if any caps
set inccommand=split
set incsearch

function! FormatJSON()
    :%!python -m json.tool
endfunction

nmap <C-i> :Telescope git_files<CR>
nmap <C-b> :Telescope buffers<CR>
nmap <C-p> <cmd>Telescope find_files<cr>
nmap <localleader>a :Telescope live_grep<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>


nmap <localleader>d :NvimTreeToggle<CR>
let g:conjure_log_direction = "horizontal"
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file", "eval"]
let g:AutoPairsFlyMode = 1
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set timeoutlen=700
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \ 'clojure': ['clj-kondo', 'joker']
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

au TextYankPost * silent! lua vim.highlight.on_yank()

call plug#begin()
" util
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'


" navigate
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope.nvim'

" pretty vim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
Plug 'arcticicestudio/nord-vim'
Plug 'gelguy/wilder.nvim'
Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}

" ide
Plug 'b3nj5m1n/kommentary', {'branch': 'main'}
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tami5/sql.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" TODO: LSP

" tricks
Plug 'simnalamburt/vim-mundo'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" editing
Plug 'machakann/vim-sandwich' " text objects surround
Plug 'tpope/vim-rsi' " use readline mappings in insert and command modes
Plug 'tpope/vim-abolish' " coercion camel/snake/etc
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" fixes
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'gioele/vim-autoswap' " get rid of annoying messages when changing files

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'roxma/vim-tmux-clipboard'

" specific languages
Plug 'bakpakin/fennel.vim'
Plug 'Olical/aniseed', { 'tag': '*' }
Plug 'kovisoft/paredit', { 'for': 'clojure' }
Plug 'clojure-vim/vim-jack-in', { 'for': 'clojure' }
Plug 'Olical/conjure', {'tag': '*', 'for': 'clojure' }
Plug 'bfredl/nvim-ipy', { 'for': 'python' }
Plug 'numirias/semshi', { 'for': 'python' }
Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'hashivim/vim-terraform'
call plug#end()

colorscheme nord
lua require('aniseed.env').init({ module = 'dotfiles.init' })

call wilder#enable_cmdline_enter()

set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? is enabled by default
call wilder#set_option('modes', ['/', '?', ':'])

set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

lua require"telescope".load_extension("frecency")
lua require('gitsigns').setup()
