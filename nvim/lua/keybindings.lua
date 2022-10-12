local map = vim.api.nvim_set_keymap
local g = vim.g

map('n', '<Space>', '', {})
g.mapleader = ' '

options = { noremap = true, silent = true }
-- remove highlight
map('n', '<leader>h', ':noh<CR>', options)
-- remove trailing ws
map('n', '<leader>w', "<cmd>lua trim_trailing_whitespaces()<CR>", options)

map('v', '<', '<gv', options)
map('v', '>', '>gv', options)

-- telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>pp', telescope.git_files, options)
vim.keymap.set('n', '<leader>pf', telescope.find_files, options)
vim.keymap.set('n', '<leader>/', telescope.live_grep, options)
vim.keymap.set('n', '<leader>*', telescope.grep_string, options)

-- neogit
map('n', '<leader>gg', "<cmd>Neogit<CR>", options)
map('n', '<leader>gb', "<cmd>GitBlameToggle<CR>", options)
