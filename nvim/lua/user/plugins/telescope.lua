local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
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

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- our picker function: find folder for file creation
local new_file = function(opts)
  local find_command = { "find", ".", "-type", "d" }
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Create new File",
    finder = finders.new_oneshot_job(find_command, opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_open_win(bufnr, true, {relative='win', row=3, col=3, width=12, height=3})
      end)
      return true
    end,
  }):find()
end

local in_git_repo = function()
  print(vim.fn.system('git rev-parse --is-inside-work-tree'))
  return vim.v.shell_error == 0
end

local project_files = function()
  if in_git_repo() then
    telescope_builtin.git_files()
  else
    telescope_builtin.find_files()
  end
end

local get_git_root = function()
    local git_path = vim.fn.system('git rev-parse --git-dir')
    return string.sub(git_path, 0, -6)
end

local project_grep = function()
    local opts = {}
    if in_git_repo() then
        opts = {
            cwd = get_git_root(),
        }
    end

    telescope_builtin.live_grep()
end

-- keybindings
vim.keymap.set('n', '<leader>pt', new_file, {desc = 'Create new file', unpack(options)})
vim.keymap.set('n', '<leader>pp', project_files, { desc = 'Files in project', unpack(options)})
vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, { desc = 'Files in folder', unpack(options)})
vim.keymap.set('n', '<leader>/', project_grep, { desc = 'Live grep', unpack(options)})
vim.keymap.set('n', '<leader>*', telescope_builtin.grep_string, { desc = 'Live grep under cursor', unpack(options)})
