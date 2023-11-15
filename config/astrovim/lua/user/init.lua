return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.clojure" },
  -- { import = "astrocommunity.motion.lean-nvim" }
    { import = "astrocommunity.pack.terraform" },
    { import = "astrocommunity.project.nvim-spectre" },
    { import = "astrocommunity.motion.mini-surround" },
    { import = "astrocommunity.motion.leap-nvim" },
    { import = "astrocommunity.motion.flit-nvim" },
    {
      "nvim-neo-tree/neo-tree.nvim",
      keys = {
        { "<leader>e", "<cmd>Neotree focus<cr>", desc = "" },
      },
    },
    { "CarloWood/vim-plugin-AnsiEsc" },
    {"m00qek/baleia.nvim", init = function()
      require('baleia').setup { }
    end}, 
    { "johmsalas/text-case.nvim", init = function()
      require('textcase').setup {}
    end }
    -- ... import any community contributed plugins here
  }
}
