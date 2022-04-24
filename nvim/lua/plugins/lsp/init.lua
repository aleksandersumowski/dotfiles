local M = {}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local vim_lsp = vim.lsp
local handlers = vim_lsp.handlers

-- Hover doc popup
local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = vim_lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = vim_lsp.with(handlers.signature_help, pop_opts)

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --[[
  nmap K <cmd>lua require"lspsaga.hover".render_hover_doc()<CR>
  nmap gi <cmd>lua vim.lsp.buf.implementation()<CR>
  nmap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

nmap <leader>ln <cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<CR>
nmap <leader>ca <cmd>lua require"lspsaga.codeaction".code_action()<CR>
nmap <leader>ca <cmd>lua require"lspsaga.codeaction".range_code_action()<CR>
nmap <leader>rn <cmd>lua require"lspsaga.rename".rename()<CR>
nmap [c <cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>
nmap ]c <cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>
nmap gr <cmd>lua vim.lsp.buf.references()<CR>
  ]] --
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua require"lspsaga.hover".render_hover_doc()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- conflict with tmux buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false,border=\'rounded\'})<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts={focusable=false,border=\'rounded\'}})<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts={focusable=false,border=\'rounded\'}})<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local register_lua_lsp = function()
  -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
  local sumneko_binary_path = '/Users/aleksandersumowski/tools/lua-language-server/bin/lua-language-server'
  local main_path = "/Users/aleksandersumowski/tools/lua-language-server/bin/main.lua"

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary_path, "-E", main_path};
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim', 'it', 'describe'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities
  }
end



M.setup = function()
  register_lua_lsp()

  require("trouble").setup( {   signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = true })

  -- Use a loop to conveniently both setup defined servers
  -- and map buffer local keybindings when the language server attaches
  local nvim_lsp = require('lspconfig')
  local servers = {"pyright", "dockerls", "html", "jsonls", "yamlls", "clojure_lsp"}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end

end
return M
