vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern= { "*.py" },
    callback = function()
        vim.cmd("silent! !/bin/black %")
    end,
})
