local bash_group = vim.api.nvim_create_augroup("BashAugroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
    group = bash_group,
    pattern = ".bash*",
    callback = function() vim.cmd("setfiletype bash") end,
})
