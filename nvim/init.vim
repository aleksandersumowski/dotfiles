let g:python3_host_prog=$HOME."/.pyenv/versions/3.9.6/bin/python3"

let mapleader = ','
let maplocalleader = ','
set timeoutlen=700
let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'

set clipboard+=unnamedplus                                        " yank and paste with the system clipboard
set hidden " hide abandoned buffers instead of unloading
set showmatch
set laststatus=2
set undofile
set cursorline
set number                    " line numbers
set scrolloff=5
set termguicolors
set shortmess+=c
set shortmess-=F " required by nvim-metals
let g:vimsyn_embed = 'l'

"folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99

"white chars
set list " show trailing whitespace
set listchars=tab:▸\ ,trail:▫

"tabbing
set softtabstop=2
set tabstop=8 expandtab smarttab
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces

"completion
set wildignore=.git,log/**,node_modules/**,target/**,.metals,.bloop,tmp/**,*.rbc,*.so,*.swp,*.class,**/.sass-cache/**
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=list:longest,full
set wildchar=<tab>
set completeopt=menuone,noinsert,noselect

"searching
set hlsearch
set ignorecase                                               " case-insensitive search
set smartcase                                                " case-sensitive search if any caps
set inccommand=split
set incsearch

function! FormatJSON()
    :%!python -m json.tool
endfunction


let g:conjure_log_direction = "horizontal"
let g:conjure#log#botright = v:true
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file", "eval"]
let g:conjure#log#wrap = v:true
let g:nvim_tree_respect_buf_cwd = 1
augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

call plug#begin('~/.vim_plugged')
" util
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'


" navigate
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ahmedkhalf/project.nvim', { 'branch': 'main' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'branch': 'main', 'do': 'make' }

" pretty vim
Plug 'kyazdani42/nvim-web-devicons'

Plug 'NTBBloodbath/galaxyline.nvim', {'branch': 'main'}
" Plug 'gelguy/wilder.nvim'
Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}
" colours!!!
Plug 'rktjmp/lush.nvim', { 'branch': 'main' }
Plug 'kunzaatko/nord.nvim', { 'branch': 'colourful' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'npxbr/gruvbox.nvim', { 'branch': 'main' }
Plug 'savq/melange'

" ide
Plug 'b3nj5m1n/kommentary', {'branch': 'main'}
Plug 'tami5/sql.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'ray-x/lsp_signature.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-nvim-lua', {'branch': 'main'}
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'PaterJason/cmp-conjure'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'folke/trouble.nvim', {'branch': 'main'}
Plug 'mfussenegger/nvim-dap'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets', {'branch': 'main'}

" tricks
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'folke/which-key.nvim', {'branch': 'main'}

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
Plug 'tmux-plugins/vim-tmux' " for editing tmux.conf
Plug 'roxma/vim-tmux-clipboard'

" specific languages
Plug 'bakpakin/fennel.vim'
Plug 'Olical/aniseed', { 'tag': '*' }
Plug 'scalameta/nvim-metals', { 'branch': 'main' }
Plug 'kovisoft/paredit', { 'for': 'clojure' }
Plug 'clojure-vim/vim-jack-in', { 'for': 'clojure' }
Plug 'Olical/conjure', {'tag': '*' }
Plug 'bfredl/nvim-luadev'
Plug 'rafcamlet/nvim-luapad'
Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'hashivim/vim-terraform'

call plug#end()

colorscheme nord


lua << EOF
function members(t)
  for k,v in pairs(t) do
    print(k .. ": " .. tostring(v))
  end
end

require('gitsigns').setup()
require("which-key").setup {}

-- my custom plugin setups
require("plugins.galaxyline").setup()
require("plugins.telescope").setup()
require('plugins.treesitter').setup()
require('plugins.lsp').setup()
require('plugins.cmp').setup()
require("project_nvim").setup {}
require('nvim-tree').setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
})
EOF

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <C-i> :Telescope git_files<CR>
nmap <C-p> <cmd>Telescope oldfiles include_current_session=true<cr>
nmap <C-tab> :Telescope buffers<CR>
nmap <C-space> :Telescope builtin<CR>
nmap <localleader>a :Telescope live_grep<cr>

nmap <localleader>d :NvimTreeToggle<CR>
nmap <localleader>f :NvimTreeFindFile<CR>

nmap gds <cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>
nmap gws <cmd>lua require"settings.telescope".lsp_workspace_symbols()<CR>
map <C-h> :TmuxNavigateLeft<CR>
map <C-l> :TmuxNavigateRight<CR>
