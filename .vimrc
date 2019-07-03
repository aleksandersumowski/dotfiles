set nocompatible               " be iMproved
" for langserv
set hidden

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
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'
let g:paredit_electric_return = 0
let g:paredit_smartjump = 1
let g:deoplete#enable_at_startup = 1
let g:vim_json_syntax_conceal = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '/usr/local/bin/eslint_d'
let g:python_host_prog='/Users/alexsandersumowski/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog='/Users/alexsandersumowski/.pyenv/versions/neovim3/bin/python'
let g:terraform_align=1

"vim command completion
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc,*.so,*.swp,*.class,**/.sass-cache/**
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.reason = '[^. *\t]\.\w*\|\h\w*|#'
let g:deoplete#sources = {}
let g:deoplete#sources.reason = ['omni', 'buffer']
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:syntastic_reason_checkers=['merlin']

"testing
set showcmd

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

" keyboard shortcuts
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l
map <C-i> :GFiles<CR>
map <C-o> :Buffers<CR>
map <C-p> :FZFMru<CR>

set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swapfiles//

let mapleader = ','
nnoremap S diw"0P
nnoremap <leader>R :%s/\s\+$//<cr>:let @/=''<CR>
nmap <leader>a :Grepper -tool rg -noprompt -query
nmap <leader>g :MundoToggle<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>r :Require<CR>
nmap <leader>e :Eval<CR>
nmap \r :!tmux send-keys -t 0:0.1 C-p C-j <CR><CR>
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

let g:ackprg = 'rg --vimgrep --no-heading'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
let g:paredit_smartjump = 1
let g:python_host_skip_check = 1
map @@x !%xmllint --format -
autocmd VimResized * :wincmd =



function! s:FzfCommandHistory()
  let s:INTERRUPT = "\u03\u0c" " <C-c><C-l>
  let s:SUBMIT = "\u0d" " <C-m>
  let s:cmdtype = getcmdtype()
  let s:args = string({
  \   "options": "--query=" . shellescape(getcmdline()),
  \ })
  if s:cmdtype == ':'
    return s:INTERRUPT . ":keepp call fzf#vim#command_history(" .  s:args . ")" . s:SUBMIT
  elseif s:cmdtype == '/'
    return s:INTERRUPT . ":keepp call fzf#vim#search_history(" .  s:args . ")" . s:SUBMIT
  else
    return ''
  endif
endfunction
cnoremap <expr> <C-g> <SID>FzfCommandHistory()
let strip_whitespace_on_save = 1

call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'w0rp/ale'
Plug 'clojure-vim/async-clj-highlight'
Plug 'clojure-vim/async-clj-omni'
Plug 'clojure-vim/clj-refactor.nvim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'vim-scripts/paredit.vim'
Plug 'tpope/vim-classpath'
Plug 'Vigemus/impromptu.nvim'
Plug 'Olical/conjure', { 'tag': 'v0.20.0', 'do': 'bin/compile', 'for': 'clojure', 'on': 'ConjureAdd'  }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'


Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'

Plug 'tpope/vim-abolish' " coercion camel/snake/etc
Plug 'tpope/vim-commentary'
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
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo'
Plug 'vim-syntastic/syntastic'
Plug 'morhetz/gruvbox'

" specific languages/data formats
Plug 'chrisbra/csv.vim'
Plug 'elzr/vim-json'
Plug 'hashivim/vim-terraform'
call plug#end()

set background=dark
colorscheme gruvbox

function! FormatJSON()
:%!python -m json.tool
endfunction

let g:grepper = { 'tools': ['rg', 'git'], }

autocmd BufNewFile,BufRead *.cljx set ft=clojure
autocmd BufNewFile,BufRead *.cljc set ft=clojure
autocmd BufNewFile,BufRead *.boot set ft=clojure
autocmd BufNewFile,BufRead *.elm set ft=elm
autocmd BufNewFile,BufRead riemann.config set ft=clojure
autocmd BufNewFile,BufRead *.conf set ft=nginx
