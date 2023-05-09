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
  if opts.is_git then
      find_command = { "git-ls-dir" }
  end

  local null_command = { "echo" }
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Create new File",
    finder = finders.new_oneshot_job(find_command, opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local folder = action_state.get_selected_entry()
        pickers.new(opts, {
            promt_title = "File Name",
            finder = finders.new_oneshot_job(null_command, opts),
            attach_mappings = function(prompt_bufnr, map)
              actions.select_default:replace(function()
                  actions.close(prompt_bufnr)
                  local file = action_state.get_current_line()
                  local path = folder[1] .. "/" .. file
                  local cmd = ":edit " .. path
                  vim.api.nvim_cmd(vim.api.nvim_parse_cmd(cmd, {}), {})
              end)
              return true
            end,
        }):find()
      end)
      return true
    end,
  }):find()
end

local in_git_repo = function()
  print(vim.fn.system('git rev-parse --is-inside-work-tree'))
  return vim.v.shell_error == 0
end

local get_git_root = function()
    local git_path = vim.fn.system('git rev-parse --git-dir')
    return string.sub(git_path, 0, -6)
end

local function project_files()
  if in_git_repo() then
    telescope_builtin.git_files()
  else
    telescope_builtin.find_files()
  end
end

local function project_grep()
    local opts = {}
    if in_git_repo() then
        opts = {
            cwd = get_git_root(),
        }
    end

    telescope_builtin.live_grep(opts)
end

local function project_find_files()
    local opts = {}
    if in_git_repo() then
        opts = {
            cwd = get_git_root(),
        }
    end
    telescope_builtin.find_files(opts)
end

local function project_new_file()
    local opts = {
        is_git = false
    }
    if in_git_repo() then
        opts = {
            cwd = get_git_root(),
            is_git = true
        }
    end

    new_file(opts)
end


-- keybindings
vim.keymap.set('n', '<leader>pt', project_new_file, {desc = 'Create new file', unpack(options)})
vim.keymap.set('n', '<leader>pp', project_files, { desc = 'Files in project', unpack(options)})
vim.keymap.set('n', '<leader>pf', project_find_files, { desc = 'Files in folder', unpack(options)})
vim.keymap.set('n', '<leader>/', project_grep, { desc = 'Live grep', unpack(options)})
vim.keymap.set('n', '<leader>*', telescope_builtin.grep_string, { desc = 'Live grep under cursor', unpack(options)})
