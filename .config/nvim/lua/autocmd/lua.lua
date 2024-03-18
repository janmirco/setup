local lua_group = vim.api.nvim_create_augroup("LuaAutoFormatAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = lua_group,
    pattern = "*.lua",
    callback = function() vim.cmd(":silent exec '! stylua --call-parentheses Always --collapse-simple-statement Always --column-width 1000 --indent-type Spaces --indent-width 4 --line-endings Unix --quote-style ForceDouble %'") end,
})
