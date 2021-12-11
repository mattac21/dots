-- Packer can manage itself
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- colors
  use 'morhetz/gruvbox'
  use 'olimorris/onedarkpro.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}

  -- lines
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
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
  use 'crispgm/nvim-go'
  -- dependencies for nvim-go
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
end)
