-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp

  -- fzf
  use 'ibhagwan/fzf-lua'

  use 'nvim-lualine/lualine.nvim'

  -- neogit
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
end)
