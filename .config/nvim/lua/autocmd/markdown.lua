local markdown_group = vim.api.nvim_create_augroup("MarkdownAutoFormatAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = markdown_group,
    pattern = { "*.md", "*.json" },
    callback = function() vim.cmd(":silent exec '! prettier --tab-width 4 --write %'") end,
})

local markdown_conceal_group = vim.api.nvim_create_augroup("MarkdownConcealGroup", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
    group = markdown_conceal_group,
    pattern = { "*.md" },
    callback = function() vim.wo.conceallevel = 0 end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
    group = markdown_conceal_group,
    pattern = { "*.md" },
    callback = function() vim.wo.conceallevel = 2 end,
})
