return {
  { "jeetsukumaran/vim-indentwise" },
  { "pedrohdz/vim-yaml-folds" },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   config = function()
  --     vim.opt.listchars:append("space:⋅")
  --     vim.opt.listchars:append("eol:↴")
  --     require("indent_blankline").setup({
  --       space_char_blankline = " ",
  --       show_current_context = true,
  --       show_current_context_start = true,
  --     })
  --   end,
  -- },
  "mbbill/undotree",
  "tpope/vim-rsi", -- readline mappings in insert and command modes,
  "tpope/vim-abolish", -- coercion camel/snake/etc,
  { "tpope/vim-unimpaired", event = "VeryLazy" },
  { "kovisoft/paredit", ft = "clojure" },
  { "tmux-plugins/vim-tmux", event = "VeryLazy" },
  { "echasnovski/mini.animate", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "akinsho/git-conflict.nvim", event = false, dependencies = { "https://gitlab.com/yorickpeterse/nvim-pqf" } },
  { "neovim/nvim-lspconfig", opts = { autoformat = false}},
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ dir = require("lazyvim.util").get_root(), reveal = true })
        end,
      },
    },
  },
}
