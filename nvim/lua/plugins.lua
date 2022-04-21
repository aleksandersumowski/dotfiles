return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- util
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'


  -- navigate
  use 'kyazdani42/nvim-tree.lua'
  use {'ahmedkhalf/project.nvim', branch = 'main' }
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-frecency.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', branch = 'main', run = 'make' }

  -- pretty vim
  use 'kyazdani42/nvim-web-devicons'
  use {'NTBBloodbath/galaxyline.nvim', branch = 'main'}
  use {'lewis6991/gitsigns.nvim', branch = 'main'}

  -- colours!!!
  use {'rktjmp/lush.nvim', branch = 'main' }
  use {'npxbr/gruvbox.nvim', branch = 'main' }
  use 'shaunsingh/nord.nvim'

  -- ide
  use {'b3nj5m1n/kommentary', branch = 'main'}
  use 'tami5/sql.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'ray-x/lsp_signature.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'neovim/nvim-lspconfig'
  use {'hrsh7th/nvim-cmp', branch = 'main'}
  use {'hrsh7th/cmp-buffer', branch = 'main'}
  use {'hrsh7th/cmp-nvim-lua', branch = 'main'}
  use {'hrsh7th/cmp-nvim-lsp', branch = 'main'}
  use 'PaterJason/cmp-conjure'
  use 'saadparwaiz1/cmp_luasnip'
  use {'folke/trouble.nvim', branch = 'main'}
  use 'mfussenegger/nvim-dap'
  use 'L3MON4D3/LuaSnip'
  use {'rafamadriz/friendly-snippets', branch = 'main'}
  use {'tanvirtin/vgit.nvim', branch = 'main'}

  -- tricks
  use 'mbbill/undotree'
  use 'jiangmiao/auto-pairs'
  use {'folke/which-key.nvim', branch = 'main'}

  -- editing
  use 'machakann/vim-sandwich' -- text objects surround
  use 'tpope/vim-rsi' -- use readline mappings in insert and command modes
  use 'tpope/vim-abolish' -- coercion camel/snake/etc
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'

  -- fixes
  use 'antoinemadec/FixCursorHold.nvim'
  use 'gioele/vim-autoswap' -- get rid of annoying messages when changing files

  -- tmux
  use 'christoomey/vim-tmux-navigator'
  use 'tmux-plugins/vim-tmux' -- for editing tmux.conf
  use 'roxma/vim-tmux-clipboard'

  -- specific languages
  use 'neo4j-contrib/cypher-vim-syntax'
  use 'bakpakin/fennel.vim'
  use {'Olical/aniseed', tag = '*' }
  use {'kovisoft/paredit', ft = 'clojure' }
  use {'clojure-vim/vim-jack-in', ft = 'clojure' }
  use {'Olical/conjure', tag = '*' }
  use {'jeetsukumaran/vim-pythonsense', ft = 'python' }
  use {'Vimjas/vim-python-pep8-indent', ft = 'python' }
  use 'hashivim/vim-terraform'
  use 'bfredl/nvim-luadev'
  use 'rafcamlet/nvim-luapad'

end)