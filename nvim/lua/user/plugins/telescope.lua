local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
            }
        }
    }
})

-- keybindings
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pp', telescope_builtin.git_files, options)
vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, options)
vim.keymap.set('n', '<leader>/', telescope_builtin.live_grep, options)
vim.keymap.set('n', '<leader>*', telescope_builtin.grep_string, options)
