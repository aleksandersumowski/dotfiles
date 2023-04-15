return {
  -- { "chrisgrieser/nvim-various-textobjs", config = function () require("various-textobjs").setup({ useDefaultKeymaps = true }) end, },
  -- { "michaeljsmith/vim-indent-object"},
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
  { import = "plugins.extras.lang.rust" },
  "gpanders/nvim-parinfer",
  { import = "lazyvim.plugins.extras.coding.copilot" },
  { "tpope/vim-unimpaired", event = "VeryLazy" },
  { "Olical/conjure", ft = "clojure" },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        clojure_lsp = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "clojure",
      }, 1, #opts.ensure_installed)
    end,
  },
  "mrjones2014/smart-splits.nvim",
  -- { "tmux-plugins/vim-tmux", event = "VeryLazy" },
  -- { "echasnovski/mini.animate", enabled = false },
  -- { "rcarriga/nvim-notify", enabled = false },
  -- { "folke/noice.nvim", enabled = false },
  { "neovim/nvim-lspconfig", opts = { autoformat = false } },
}
