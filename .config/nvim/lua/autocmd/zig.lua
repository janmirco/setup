local zig_group = vim.api.nvim_create_augroup("ZigAutoFormatAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = zig_group,
    pattern = "*.zig",
    callback = function() vim.cmd(":silent exec '! zig fmt %'") end,
})
