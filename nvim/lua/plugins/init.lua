-- Packer can manage itself
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'lukas-reineke/indent-blankline.nvim'

  -- colors
  use 'morhetz/gruvbox'
  use '~/code/gruvbox-baby'
  use 'olimorris/onedarkpro.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

  use 'kyazdani42/nvim-web-devicons'
  use 'feline-nvim/feline.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- searching
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- completion
  use 'windwp/nvim-autopairs'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use 'folke/lsp-colors.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'

  -- better go support
  use 'ray-x/go.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
end)
