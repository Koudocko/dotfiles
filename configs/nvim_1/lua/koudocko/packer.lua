-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  })

  use('folke/tokyonight.nvim')
  use('Mofiqul/dracula.nvim')
  use('navarasu/onedark.nvim')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'hrsh7th/cmp-path'}, -- Required
      {'hrsh7th/cmp-buffer'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'saadparwaiz1/cmp_luasnip'},
		  {'rafamadriz/friendly-snippets'},
      {'simrat39/rust-tools.nvim'}
    }
  }

  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  use('tpope/vim-commentary')

  use('lambdalisue/suda.vim')

  use('ThePrimeagen/harpoon')

  use ('mbbill/undotree')

  use('tpope/vim-fugitive')

  use('norcalli/nvim-colorizer.lua')

  use('lewis6991/gitsigns.nvim')

  use('andweeb/presence.nvim')

  use('lukas-reineke/indent-blankline.nvim')

  use('lvimuser/lsp-inlayhints.nvim')

  use('folke/trouble.nvim')

  use('lervag/vimtex')

  use('jose-elias-alvarez/null-ls.nvim')

  -- use('github/copilot.vim')
  use('zbirenbaum/copilot.lua')

  use('benknoble/vim-racket')

  use('tpope/vim-surround')
end)
