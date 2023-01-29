-- require("impatient").enable_profile()
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.python3_host_prog = vim.env.HOME .. "/.pyenv/versions/3.11.1/bin/python3"
vim.g.C_Ctrl_j = 'off'
vim.g.BASH_Ctrl_j = 'off'

vim.opt.timeoutlen=700
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
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99

--white chars
vim.opt.list = true -- show trailing whitespace
vim.opt.listchars = { trail = '▫'
,tab = '▸ '
-- ,tab = '▸' cant make this to work
}
--tabbing
vim.opt.tabstop=8
vim.opt.shiftwidth=8
vim.opt.expandtab=true

--completion
vim.opt.wildignore= {".git","log/**","node_modules/**","target/**",".metals",".bloop","tmp/**","*.rbc","*.so","*.swp","*.class","**/.sass-cache/**"}
vim.opt.wildmenu = true
vim.opt.wildmode="longest:full,lastused"
vim.opt.wildchar=('<tab>'):byte()
vim.opt.completeopt={'longest','menuone','noselect'}

--searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.g.conjure_log_direction = "horizontal"
vim.g["conjure#log#botright"] = true
vim.g.conjure_log_blacklist = {"up", "ret", "ret-multiline", "load-file", "eval"}
vim.g["conjure#log#wrap"] = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup('plugins')

vim.api.nvim_set_keymap("n", "gf", ":e <cfile><CR>", { noremap = true, }) -- create non-existing files when `gf`
vim.api.nvim_set_keymap("n", "<leader>H", "", {
        noremap = true,
        callback = function()
                print("Hello world!")
        end,
})

local function t(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
        return vim.fn.pumvisible() == 1 and t'<C-N>' or t'<Tab>'
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
vim.keymap.set('n','<leader>i', ':Telescope git_files<CR>')
vim.keymap.set('n','<leader>p', ':Telescope oldfiles include_current_session=true<CR>')
vim.keymap.set('n','<leader><tab>', ':Telescope buffers<CR>')
vim.keymap.set('n','<leader><space>', ':Telescope builtin<CR>')
vim.keymap.set('n','<leader>a', ':Telescope live_grep theme=ivy<CR>')
vim.keymap.set('n','<leader>i', ':Telescope git_files<CR>')
vim.keymap.set('n','<leader>s', ':source $MYVIMRC<CR>')
vim.keymap.set('n','gds', '<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>')
vim.keymap.set('n','gws', '<cmd>lua require"settings.telescope".lsp_workspace_symbols()<CR>')
vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>')


local augroup = vim.api.nvim_create_augroup('bigquery', {clear = true})

vim.api.nvim_create_autocmd('BufNewFile,BufRead', {
        pattern = '*.bq',
        group = augroup,
        command = 'set ft=sql'
})

vim.api.nvim_create_user_command(
'FormatJSON',
":%!python3 -m json.tool",
{})

-- Highlight on yank
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
        command = "silent! lua vim.highlight.on_yank()",
        group = yankGrp,
})

vim.api.nvim_create_autocmd(
"BufWritePre",
{ pattern = "*", command = "%s/\\s\\+$//e" }
)