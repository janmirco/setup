local py_group = vim.api.nvim_create_augroup("PythonAutoFormatAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = py_group,
    pattern = "*.py",
    callback = function()
        vim.cmd(":silent exec '! python3 -m isort --profile=black --line-length=1000 %'")
        vim.cmd(":silent exec '! python3 -m black --line-length=1000 %'")
    end,
})
