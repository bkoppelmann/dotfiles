local map = vim.api.nvim_set_keymap
local g = vim.g

map('n', '<Space>', '', {})
g.mapleader = ' '

options = { noremap = true, silent = true }
-- remove highlight
map('n', '<leader>h', ':noh<CR>', options)

-- Disable annoying command line typo.
map('n', 'q:', ':q', options)

-- remove trailing ws
map('n', '<leader>w', "<cmd>lua trim_trailing_whitespaces()<CR>", options)

map('v', '<', '<gv', options)
map('v', '>', '>gv', options)

-- neogit
map('n', '<leader>gg', "<cmd>Neogit<CR>", options)
map('n', '<leader>gb', "<cmd>GitBlameToggle<CR>", options)
