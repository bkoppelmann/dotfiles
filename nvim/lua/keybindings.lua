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

map('n', '<leader>p', "<cmd>lua require('fzf-lua').git_files()<CR>", options)
map('n', '<leader>/', "<cmd>lua require('fzf-lua').live_grep()<CR>", options)
map('n', '<leader>*', "<cmd>lua require('fzf-lua').grep_cword()<CR>", options)
map('n', '<leader>g', "<cmd>Neogit<CR>", options)
