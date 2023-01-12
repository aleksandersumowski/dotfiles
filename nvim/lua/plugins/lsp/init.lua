require("mason").setup()
require("mason-lspconfig").setup({
        ensure_installed = {
        "kotlin_language_server", "rust_analyzer" ,"sumneko_lua", "clojure_lsp"}
})

local null_ls = require("null-ls")

null_ls.setup({
        sources = {
                null_ls.builtins.diagnostics.clj_kondo,
                null_ls.builtins.formatting.rustfmt,
                null_ls.builtins.formatting.cljstyle ,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.completion.spell,
        },
})
require("mason-null-ls").setup({
    ensure_installed = { "stylua", "cljstyle", "jq", "rustfmt" }
})
local M = {}
local vim_lsp = vim.lsp
local handlers = vim_lsp.handlers

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = vim_lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = vim_lsp.with(handlers.signature_help, pop_opts)

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>s', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

M.setup = function()

require("lspconfig").sumneko_lua.setup {
        on_attach = on_attach,
        settings = {
                Lua = {
                        runtime = { version = 'LuaJIT', },
                        diagnostics = { globals = {'vim'}, },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true), },
                        telemetry = { enable = false, },
                },
        },
        capabilities = capabilities
}
  -- Use a loop to conveniently both setup defined servers
  -- and map buffer local keybindings when the language server attaches
  local nvim_lsp = require('lspconfig')
  local servers = {"dockerls", "jsonls", "yamlls", "clojure_lsp", "terraform_lsp",  "kotlin_language_server"}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      on_attach(_, bufnr)
    end
  },
})
end
return M
