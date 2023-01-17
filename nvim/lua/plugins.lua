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


return require('lazy').setup({
  -- {"akinsho/toggleterm.nvim", tag = '*', config = function()
  --         require("toggleterm").setup{ }
  -- end},
  -- util,
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  -- { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "jose-elias-alvarez/null-ls.nvim", "jayp0521/mason-null-ls.nvim", "j-hui/fidget.nvim" },

  -- navigate
  {'nvim-tree/nvim-tree.lua',
       config = function()
               require('nvim-tree').setup {
                       respect_buf_cwd = true,
                       update_cwd = true,
                       update_focused_file = {
                               enable = true,
                               update_cwd = true
                       },
               }
       end
       },

  -- {'ahmedkhalf/project.nvim', branch = 'main' }
  {'nvim-telescope/telescope.nvim', branch = '0.1.x' },

  {'nvim-telescope/telescope-fzf-native.nvim', branch = 'main', build = 'make' },
  -- {
  --   "AckslD/nvim-neoclip.lua",
  --   dependencies = {
  --     {'nvim-telescope/telescope.nvim'},
  --   },
  --   config = function()
  --     require('neoclip').setup()
  --   end,
  -- },
  -- 'ilAYAli/scMRU.nvim',
  {'jeetsukumaran/vim-indentwise'},
  {'pedrohdz/vim-yaml-folds'},

  -- pretty vim
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    config = function()
        require('lualine').setup({})
    end
  },
  -- {'lewis6991/gitsigns.nvim', branch = 'main'},
  {'lukas-reineke/indent-blankline.nvim', config = function ()
          vim.opt.listchars:append("space:⋅")
          vim.opt.listchars:append("eol:↴")
          require("indent_blankline").setup {
                  space_char_blankline = " ",
                  show_current_context = true,
                  show_current_context_start = true,
          }
  end},

  -- {'kevinhwang91/nvim-ufo', branch = 'main', dependencies = 'kevinhwang91/promise-async'}

  -- -- colours!!!
  {'rktjmp/lush.nvim', branch = 'main' },
  {'npxbr/gruvbox.nvim', branch = 'main' },
  'shaunsingh/nord.nvim',

  -- ide
  {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  },
  -- 'ggandor/lightspeed.nvim'
  -- 'tami5/sql.nvim'
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  -- 'nvim-treesitter/playground',
  -- 'ray-x/lsp_signature.nvim',
  -- 'simrat39/symbols-outline.nvim',
  -- 'neovim/nvim-lspconfig',
  {'hrsh7th/nvim-cmp', branch = 'main'},
  {'hrsh7th/cmp-buffer', branch = 'main'},
  {'hrsh7th/cmp-nvim-lua', branch = 'main'},
  -- {'hrsh7th/cmp-nvim-lsp', branch = 'main'},
  -- {'hrsh7th/cmp-nvim-lsp-signature-help', branch = 'main'},
  {'hrsh7th/cmp-path', branch = 'main'},
  'saadparwaiz1/cmp_luasnip',
  {
          'petertriho/cmp-git',
          dependencies = "nvim-lua/plenary.nvim",
          config = function()
                  require("cmp_git").setup()
          end
  },
  {'PaterJason/cmp-conjure', ft = 'clojure'},
  {"L3MON4D3/LuaSnip", tag = "v1.*"},
  -- {
  --   "folke/trouble.nvim",
  --   dependencies = "kyazdani42/nvim-web-devicons",
  --   config = function()
  --     require("trouble").setup { }
  --   end
  -- },
  -- 'mfussenegger/nvim-dap'
  -- {'rafamadriz/friendly-snippets', branch = 'main'}
  -- {'tanvirtin/vgit.nvim', branch = 'main'}
  --
  -- -- tricks
  'mbbill/undotree',
  'jiangmiao/auto-pairs',
  {'folke/which-key.nvim', branch = 'main'},
  --
  -- -- editing
  'tpope/vim-rsi', -- readline mappings in insert and command modes,
  'tpope/vim-abolish', -- coercion camel/snake/etc,
  'tpope/vim-repeat',
  'tpope/vim-unimpaired',

  -- -- fixes
  'antoinemadec/FixCursorHold.nvim',
  'gioele/vim-autoswap', -- get rid of annoying messages when changing files

  -- -- tmux
  {
      "aserowy/tmux.nvim",
      config = function() require("tmux").setup() end
  },
  -- 'tmux-plugins/vim-tmux', -- for editing tmux.conf
  -- 'roxma/vim-tmux-clipboard',

  -- -- specific languages
  -- {'neo4j-contrib/cypher-vim-syntax', ft = 'cypher'},
  {'bakpakin/fennel.vim', ft='fennel'},
  {'Olical/aniseed', tag = '*' },
  {'kovisoft/paredit', ft = 'clojure' },
  -- {'clojure-vim/vim-jack-in', ft = 'clojure' },
  -- {'udalov/kotlin-vim', branch = 'master'},
  -- {'simrat39/rust-tools.nvim', branch = 'master'},
 --  { 'saecki/crates.nvim',
 --      tag = 'v0.3.0',
 --      dependencies = { 'nvim-lua/plenary.nvim' },
 --      config = function()
 --          require('crates').setup()
 --      end,
 -- },
  -- {'Olical/conjure', tag = '*', ft = 'clojure' },
  -- {'jeetsukumaran/vim-pythonsense', ft = 'python' },
  -- {'Vimjas/vim-python-pep8-indent', ft = 'python' },
  {'hashivim/vim-terraform', ft='terraform'},
  {'bfredl/nvim-luadev', ft='lua'},
  {'rafcamlet/nvim-luapad', ft='lua'},
  'machakann/vim-sandwich',-- text objects surround
  'fatih/vim-go', -- for go templates!
  {'ggandor/leap.nvim', config = function ()
          require('leap').add_default_mappings()
  end}

})
