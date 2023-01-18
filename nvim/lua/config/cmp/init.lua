local M = {}
M.setup = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
                snippet = {
                        expand = function(args)
                                luasnip.lsp_expand(args.body)
                        end,
                },
                -- You must set mapping if you want.
                mapping = cmp.mapping.preset.insert({
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ["<Tab>"] = function(fallback)
                                if cmp.visible() then
                                        cmp.select_next_item()
                                else
                                        fallback()
                                end
                        end,
                        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                -- You should specify your *installed* sources.
                sources = {
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "buffer" },
                        { name = 'nvim_lsp_signature_help' },
                },
        })

        cmp.setup.filetype("lua", {
                sources = {
                        { name = "nvim_lsp" },
                        { name = "nvim_lua" },
                        { name = "luasnip" },
                        { name = "buffer" },
                        { name = 'nvim_lsp_signature_help' },
                },
        })

        cmp.setup.filetype("clojure", {
                sources = {
                        { name = "conjure" },
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "buffer" },
                        { name = 'nvim_lsp_signature_help' },
                },
        })

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                        { name = "buffer" },
                },
        })

        cmp.setup.cmdline("?", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                        { name = "buffer" },
                },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                        { name = "path" },
                }, {
                        { name = "cmdline" },
                }),
        })

        vim.api.nvim_create_autocmd("BufRead", {
                group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
                pattern = "Cargo.toml",
                callback = function()
                        cmp.setup.buffer({ sources = { { name = "crates" } } })
                end,
        })
end
return M