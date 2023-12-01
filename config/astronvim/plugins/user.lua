return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {{"<leader>e", "<cmd>Neotree focus<cr>", desc = ""}}
    }, {"CarloWood/vim-plugin-AnsiEsc"},
    {"m00qek/baleia.nvim", init = function() require("baleia").setup {} end}, {
        "johmsalas/text-case.nvim",
        init = function() require("textcase").setup {} end
    }
    -- ... import any community contributed plugins here
    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    -- "andweeb/presence.nvim",
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
}
