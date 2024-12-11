local rs_group = vim.api.nvim_create_augroup("RustAutoFormatAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = rs_group,
    pattern = "*.rs",
    callback = function() vim.cmd(":silent exec '! rustfmt %'") end,
})
