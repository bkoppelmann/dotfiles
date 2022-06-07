local v = vim.api
local o = vim.o

o.ls = 2
o.swapfile = false
o.hlsearch = true
o.ignorecase = true
o.tabstop = 4
o.cursorline = true
o.lazyredraw = true
vim.cmd("hi CursorLine cterm=NONE ctermbg=Black guibg=Black guifg=NONE")
o.expandtab = true
o.number = true
o.relativenumber = true
o.scrolloff = 999
o.textwidth = 80
-- TODO: show tabs
-- o.list.lcs = tab:»·
o.backspace = 2
o.wildmenu = true
o.wrapscan = true
vim.cmd("colorscheme kbastian")
