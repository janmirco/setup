local markdown_group = vim.api.nvim_create_augroup("MarkdownAutoFormatAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = markdown_group,
    pattern = "*.md",
    callback = function() vim.cmd(":silent exec '! npx prettier --tab-width 4 --write %'") end,
})
