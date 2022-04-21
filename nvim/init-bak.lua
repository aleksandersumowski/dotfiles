vim.g.python3_host_prog = vim.env.HOME .. "/.pyenv/versions/3.9.7/bin/python3"

vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.opt.timeoutlen=700
vim.g.C_Ctrl_j = 'off'
vim.g.BASH_Ctrl_j = 'off'

vim.opt.clipboard=vim.opt.clipboard + "unnamedplus" -- yank and paste with the system clipboard
vim.opt.hidden = true -- hide abandoned buffers instead of unloading
vim.opt.showmatch = true
vim.opt.laststatus=2
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.number = true -- line numbers
vim.opt.scrolloff=5
vim.opt.termguicolors = true
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.g.vimsyn_embed = 'l'

--white chars
vim.opt.list = true -- show trailing whitespace
-- vim.opt.listchars={tab='▸', trail='▫'}

--tabbing
vim.opt.tabstop=8
vim.opt.expandtab=true

--completion
vim.opt.wildignore= {".git","log/**","node_modules/**","target/**",".metals",".bloop","tmp/**","*.rbc","*.so","*.swp","*.class","**/.sass-cache/**"}
vim.opt.wildmenu = true
-- vim.opt.wildmode=list:longest,full
-- vim.opt.wildchar='<tab>'
-- vim.opt.completeopt=menuone,noinsert,noselect

--searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

--[[ function! FormatJSON()
    :%!python -m json.tool
endfunction
 ]]

vim.g.conjure_log_direction = "horizontal"
vim.g["conjure#log#botright"] = true
vim.g.conjure_log_blacklist = {"up", "ret", "ret-multiline", "load-file", "eval"}
vim.g["conjure#log#wrap"] = true
vim.g.nvim_tree_respect_buf_cwd = 1

local function members(t)
  for k,v in pairs(t) do
    print(k .. ": " .. tostring(v))
  end
end

require('plugins')
require('vgit').setup()
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
vim.api.nvim_set_keymap("n", "<leader>H", "", {
    noremap = true,
    callback = function()
        print("Hello world!")
    end,
})
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

vim.keymap.set("n","C-i",":Telescope git_files<CR>")
--[[ nmap <C-i> :Telescope git_files<CR>
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
 ]]

--[[ augroup bigquery
  au!
  autocmd BufNewFile,BufRead *.bq   vim.opt.syntax=sql
augroup end ]]


-- Highlight on yank
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

vim.cmd[[colorscheme nord]]
