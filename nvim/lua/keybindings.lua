local map = vim.api.nvim_set_keymap
local g = vim.g

map('n', '<Space>', '', {})
g.mapleader = ' '

options = { noremap = true, silent = true }
-- remove highlight
map('n', '<leader>h', ':noh<CR>', options)
-- remove trailing ws
-- TODO: vim.cmd("map <Leader>w :%s/\s\+$//e<CR>")

map('v', '<', '<gv', options)
map('v', '>', '>gv', options)

map('n', '<leader>p', "<cmd>lua require('fzf-lua').git_files()<CR>", options)
map('n', '<leader>/', "<cmd>lua require('fzf-lua').live_grep()<CR>", options)
map('n', '<leader>*', "<cmd>lua require('fzf-lua').grep_cword()<CR>", options)
