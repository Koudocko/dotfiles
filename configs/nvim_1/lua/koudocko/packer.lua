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

  use('marko-cerovac/material.nvim')
  use('EdenEast/nightfox.nvim')
  use('folke/tokyonight.nvim')

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
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  use('tpope/vim-commentary')

  -- use('ap/vim-css-color')

  use('jiangmiao/auto-pairs')

  use('lambdalisue/suda.vim')

  use('ThePrimeagen/harpoon')

  use ('mbbill/undotree')

  use('tpope/vim-fugitive')

  use('norcalli/nvim-colorizer.lua')

  use('lewis6991/gitsigns.nvim')

end)