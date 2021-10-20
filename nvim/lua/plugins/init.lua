return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use 'windwp/nvim-autopairs'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind-nvim'
  use 'folke/lsp-colors.nvim'
  use {
    "ray-x/lsp_signature.nvim",
  }
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
  use 'mfussenegger/nvim-lint'

  use 'crispgm/nvim-go'
  -- dependencies for nvim-go
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
end)
