local py_group = vim.api.nvim_create_augroup("PythonAutoFormatAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = py_group,
    pattern = "*.py",
    callback = function()
        vim.cmd(":silent exec '! ruff check --select I --fix %'") -- sort imports
        vim.cmd(":silent exec '! ruff format %'")
    end,
})
