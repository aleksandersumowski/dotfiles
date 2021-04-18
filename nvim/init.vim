let g:python3_host_prog=$HOME."/.pyenv/versions/3.9.0/bin/python3"

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
" set shortmess-=F " required by nvim-metals

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

nmap <C-i> :Telescope git_files<CR>
nmap <C-b> :Telescope buffers<CR>
nmap <C-p> <cmd>Telescope frecency<cr>
nmap <C-l> <cmd>Telescope find_files<cr>
nmap <localleader>a :Telescope live_grep<cr>
nmap <localleader>d :NvimTreeToggle<CR>

let g:conjure_log_direction = "horizontal"
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file", "eval"]
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \ 'clojure': ['clj-kondo', 'joker']
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}

augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

call plug#begin()
" util
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'


" navigate
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" pretty vim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/galaxyline.nvim', {'branch': 'main'}
Plug 'arcticicestudio/nord-vim'
Plug 'gelguy/wilder.nvim'
Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}

" ide
Plug 'b3nj5m1n/kommentary', {'branch': 'main'}
Plug 'dense-analysis/ale'
Plug 'tami5/sql.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', {'branch': 'main'}
Plug 'mfussenegger/nvim-dap'

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
Plug 'scalameta/nvim-metals', { 'branch': 'main' }
Plug 'kovisoft/paredit', { 'for': 'clojure' }
Plug 'clojure-vim/vim-jack-in', { 'for': 'clojure' }
Plug 'Olical/conjure', {'tag': '*', 'for': 'clojure' }
Plug 'tami5/compe-conjure', {'for': 'clojure'}
Plug 'bfredl/nvim-ipy', { 'for': 'python' }
Plug 'numirias/semshi', { 'for': 'python' }
Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'hashivim/vim-terraform'
call plug#end()

colorscheme nord

call wilder#enable_cmdline_enter()

" only / and ? is enabled by default
call wilder#set_option('modes', ['/', '?', ':'])
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))

set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

lua << EOF
require("settings.galaxyline").setup()
require("settings.compe").setup()
require("settings.telescope").setup()
require("settings.lsp").setup()
require('aniseed.env').init({ module = 'dotfiles.init' })

require('gitsigns').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
local nvim_lsp = require('lspconfig')
require("lspsaga").init_lsp_saga({
  server_filetype_map = { metals = { "sbt", "scala" } },
  code_action_prompt = { virtual_text = false },
})
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap("n", "gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
  buf_set_keymap("n", "K", [[<cmd>lua require"lspsaga.hover".render_hover_doc()<CR>]])
  buf_set_keymap("n", "gi", [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
  buf_set_keymap("n", "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]])
  buf_set_keymap("n", "gds", [[<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>]])
  buf_set_keymap("n", "gws", [[<cmd>lua require"settings.telescope".lsp_workspace_symbols()<CR>]])
  buf_set_keymap("n", "<leader>rn", [[<cmd>lua require"lspsaga.rename".rename()<CR>]])
  buf_set_keymap("n", "<leader>ca", [[<cmd>lua require"lspsaga.codeaction".code_action()<CR>]])
  buf_set_keymap("v", "<leader>ca", [[<cmd>lua require"lspsaga.codeaction".range_code_action()<CR>]])
  buf_set_keymap("n", "<leader>ws", [[<cmd>lua require"metals".worksheet_hover()<CR>]])
  buf_set_keymap("n", "<leader>a", [[<cmd>lua require"metals".open_all_diagnostics()<CR>]])
  buf_set_keymap("n", "<leader>d", [[<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>]]) -- buffer diagnostics only
  buf_set_keymap("n", "]c", [[<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>]])
  buf_set_keymap("n", "[c", [[<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>]])
  buf_set_keymap("n", "<leader>ln", [[<cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<CR>]])
print('test')
  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
