local o = vim.o
local fn = vim.fn
local cmd = vim.api.nvim_command

function trim_trailing_whitespaces()
    if not o.binary and o.filetype ~= 'diff' then
        local current_view = fn.winsaveview()
        cmd([[keeppatterns %s/\s\+$//e]])
        fn.winrestview(current_view)
    end
end

function in_git_repo()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  return vim.v.shell_error == 0
end

function get_git_root()
    local git_path = vim.fn.system('git rev-parse --show-toplevel')
    return string.sub(git_path, 0, -2)
end
