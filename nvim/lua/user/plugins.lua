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

  -- which key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('user.plugins.which-key')
     end
  }

  -- fuzzy finder
  use({
    'nvim-telescope/telescope.nvim',
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

  -- git blame
  use {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup {
        enabled = false,
      }
    end
  }

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

  -- editorconfig
  use({
    "gpanders/editorconfig.nvim"
  })

  -- startup
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('user.plugins.alpha')
    end,
  }

  -- shows a bar for each scope
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("ibl").setup()
    end,
  }

  -- autopairs
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  -- colorschema
  use {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme kbastian2")
    end
  }
  -- autoformatter
  use {
    "mhartington/formatter.nvim",
    config = function()
      require('user.plugins.formatter')
    end
  }

end)
