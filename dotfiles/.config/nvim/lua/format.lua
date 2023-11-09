vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PythonAugroup", {clear = true}),
    pattern = "*.py",
    callback = function()
        vim.cmd(":silent exec '! python3 -m isort --profile=black --line-length=1000 %'")
        vim.cmd(":silent exec '! python3 -m black --line-length=1000 %'")
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("CppAugroup", {clear = true}),
    pattern = {"*.cpp", "*.hpp", "*.c", "*.h"},
    callback = function()
        vim.cmd(":silent exec '! clang-format -i --style=file:$HOME/.config/nvim/lua/.clang-format %'")
    end,
})
