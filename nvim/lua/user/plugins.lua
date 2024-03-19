-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('user.plugins.telescope')
    end,
  },
  -- which key
  {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('user.plugins.which-key')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('user.plugins.lualine')
    end,
  },
  {
    'TimUntersberger/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('user.plugins.neogit')
    end,
  },
  {
    'f-person/git-blame.nvim',
    config = function()
    require('gitblame').setup {
      enabled = false,
    }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter' ,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require('user.plugins.treesitter')
    end,
  },
  {
    "gpanders/editorconfig.nvim"
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('user.plugins.alpha')
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('user.plugins.lspconfig')
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('user.plugins.luasnip')
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme kbastian2")
    end,
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      require('user.plugins.formatter')
    end,
  },
})
