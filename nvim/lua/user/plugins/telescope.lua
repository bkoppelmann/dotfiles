-- keybindings
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>pp', telescope.git_files, options)
vim.keymap.set('n', '<leader>pf', telescope.find_files, options)
vim.keymap.set('n', '<leader>/', telescope.live_grep, options)
vim.keymap.set('n', '<leader>*', telescope.grep_string, options)
