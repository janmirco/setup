local git_commit_group = vim.api.nvim_create_augroup("GitCommitAugroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
    group = git_commit_group,
    pattern = "COMMIT_EDITMSG",
    callback = function()
        vim.opt.colorcolumn = { 51, 73 }
        vim.cmd("setlocal spell spelllang=en_us")
    end,
})
