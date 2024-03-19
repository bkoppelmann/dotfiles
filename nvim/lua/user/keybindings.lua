local map = vim.api.nvim_set_keymap
local g = vim.g

--map('n', '<Space>', '', {})
g.mapleader = ' '

options = { noremap = true, silent = true }
-- remove highlight
map('n', '<leader>h', ':noh<CR>', { silent = true , desc = "No search highlight", unpack(options)})

-- Disable annoying command line typo.
map('n', 'q:', ':q', options)

-- Move lines around
map('n', '<C-j>', ':move .+1<CR>', options)
map('n', '<C-k>', ':move .-2<CR>', options)

-- remove trailing ws
map('n', '<leader>w', "<cmd>lua trim_trailing_whitespaces()<CR>", { desc = "Remove trailing whitespace", unpack(options)})

map('v', '<', '<gv', options)
map('v', '>', '>gv', options)

-- neogit
map('n', '<leader>gg', "<cmd>Neogit<CR>", { desc = "NeoGit", unpack(options)})
map('n', '<leader>gb', "<cmd>GitBlameToggle<CR>", options)

-- terminal
map('t', '<ESC>', '<C-\\><C-n>', options)
map('n', '<leader>t', '<cmd> lua enable_terminal()<CR>', { desc = "Open terminal", unpack(options)})

function enable_terminal()
    vim.cmd('split') 
    vim.cmd('terminal') 
    vim.cmd('startinsert')
end
