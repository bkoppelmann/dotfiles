-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Autocomplete
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = {
        'neovim/nvim-lspconfig',
        'hrsh7th/nvim-cmp',
    },
    config = function()
      require('user.plugins.lspconfig')
    end,
  }

  -- fuzzy finder
  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
        require('user.plugins.telescope')
    end,
  })

  -- status line
  use({
      'nvim-lualine/lualine.nvim',
      config = function()
          require('user.plugins.lualine')
      end,
  })
  -- neogit
  use({
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
        require('user.plugins.neogit')
    end,
  })
  use { 'f-person/git-blame.nvim' }

  -- treesitter
  use({
    'nvim-treesitter/nvim-treesitter' ,
    requires = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
        require('user.plugins.treesitter')
    end,
  })

  -- leap
  use({
    "ggandor/leap.nvim",
    config = function()
        require('user.plugins.leap')
    end,
  })

  -- lusnip
   use({
     'L3MON4D3/LuaSnip',
     config = function()
       require('user.plugins.luasnip')
     end,
   })

end)
