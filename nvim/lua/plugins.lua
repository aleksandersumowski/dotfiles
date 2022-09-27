return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
  --         require("toggleterm").setup{
  -- }
  -- end}
  -- util
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'lewis6991/impatient.nvim'


  -- navigate
  use {'kyazdani42/nvim-tree.lua',
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
       }

  -- use {'ahmedkhalf/project.nvim', branch = 'main' }
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', branch = 'main', run = 'make' }
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }
  -- use 'ilAYAli/scMRU.nvim'
  use {'jeetsukumaran/vim-indentwise'}
  use {'pedrohdz/vim-yaml-folds'}

  -- pretty vim
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
        require('lualine').setup()
    end
  }
  use {'lewis6991/gitsigns.nvim', branch = 'main'}
  use {'lukas-reineke/indent-blankline.nvim', config = function ()
          vim.opt.listchars:append("space:⋅")
          vim.opt.listchars:append("eol:↴")
          require("indent_blankline").setup {
                  space_char_blankline = " ",
                  show_current_context = true,
                  show_current_context_start = true,
          }
  end}

  -- use {'kevinhwang91/nvim-ufo', branch = 'main', requires = 'kevinhwang91/promise-async'}

  -- -- colours!!!
  use {'rktjmp/lush.nvim', branch = 'main' }
  use {'npxbr/gruvbox.nvim', branch = 'main' }
  use 'shaunsingh/nord.nvim'

  -- ide
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use 'ggandor/lightspeed.nvim'
  -- use 'tami5/sql.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- use 'nvim-treesitter/playground'
  use 'ray-x/lsp_signature.nvim'
  -- use 'simrat39/symbols-outline.nvim'
  use 'neovim/nvim-lspconfig'
  use {'hrsh7th/nvim-cmp', branch = 'main'}
  use {'hrsh7th/cmp-buffer', branch = 'main'}
  use {'hrsh7th/cmp-nvim-lua', branch = 'main'}
  use {'hrsh7th/cmp-nvim-lsp', branch = 'main'}
  use 'saadparwaiz1/cmp_luasnip'
  use {
          'petertriho/cmp-git',
          requires = "nvim-lua/plenary.nvim",
          config = function()
                  require("cmp_git").setup()
          end
  }
  use 'PaterJason/cmp-conjure'
  use({"L3MON4D3/LuaSnip", tag = "v1.*"})
  use {'folke/trouble.nvim', branch = 'main'}
  -- use 'mfussenegger/nvim-dap'
  -- use 'L3MON4D3/LuaSnip'
  -- use {'rafamadriz/friendly-snippets', branch = 'main'}
  -- use {'tanvirtin/vgit.nvim', branch = 'main'}
  --
  -- -- tricks
  use 'mbbill/undotree'
  use 'jiangmiao/auto-pairs'
  use {'folke/which-key.nvim', branch = 'main'}
  --
  -- -- editing
  use 'machakann/vim-sandwich' -- text objects surround
  use 'tpope/vim-rsi' -- use readline mappings in insert and command modes
  use 'tpope/vim-abolish' -- coercion camel/snake/etc
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'

  -- -- fixes
  use 'antoinemadec/FixCursorHold.nvim'
  use 'gioele/vim-autoswap' -- get rid of annoying messages when changing files

  -- -- tmux
  use 'christoomey/vim-tmux-navigator'
  use 'tmux-plugins/vim-tmux' -- for editing tmux.conf
  use 'roxma/vim-tmux-clipboard'

  -- -- specific languages
  use {'neo4j-contrib/cypher-vim-syntax', ft = 'cypher'}
  use {'bakpakin/fennel.vim', ft='fennel'}
  use {'Olical/aniseed', tag = '*' }
  use {'kovisoft/paredit', ft = 'clojure' }
  use {'clojure-vim/vim-jack-in', ft = 'clojure' }
  use {'Olical/conjure', tag = '*' }
  use {'jeetsukumaran/vim-pythonsense', ft = 'python' }
  use {'Vimjas/vim-python-pep8-indent', ft = 'python' }
  use {'hashivim/vim-terraform', ft='terraform'}
  use {'bfredl/nvim-luadev', ft='lua'}
  use {'rafcamlet/nvim-luapad', ft='lua'}

end)
