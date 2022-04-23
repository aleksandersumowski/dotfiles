local M = {}
M.setup = function()
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'

  cmp.setup {
    snippet = {
       expand = function(args)
         require'luasnip'.lsp_expand(args.body)
       end
     },
    -- You must set mapping if you want.
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    -- You should specify your *installed* sources.
    sources = {
      {name = 'nvim_lsp'},
      {name = 'luasnip'},
      {name = 'nvim_lua'},
      {name = 'buffer'},
    }
  }

  cmp.setup.filetype('clojure',{
          sources = {
                  {name = 'conjure'},
                  {name = 'nvim_lsp'},
                  {name = 'luasnip'},
                  {name = 'buffer'},
          }
  })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end
return M
