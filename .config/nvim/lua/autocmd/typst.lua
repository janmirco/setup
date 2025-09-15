local typ_group = vim.api.nvim_create_augroup("TypstAutoFormatAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = typ_group,
    pattern = "*.typ",
    callback = function() vim.cmd(":silent exec '! typstyle --line-width 1000 --indent-width 4 --inplace %'") end,
})
