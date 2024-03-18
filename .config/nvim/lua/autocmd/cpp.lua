local cpp_group = vim.api.nvim_create_augroup("CppAutoFormatAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = cpp_group,
    pattern = { "*.cpp", "*.hpp", "*.c", "*.h" },
    callback = function() vim.cmd(":silent exec '! clang-format -i --style=file:$HOME/.config/nvim/.clang-format %'") end,
})
