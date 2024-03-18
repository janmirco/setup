local mathematica_group = vim.api.nvim_create_augroup("MathematicaAugroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
    group = mathematica_group,
    pattern = { "*.ma", "*.mm", "*.mma" },
    callback = function() vim.cmd("setfiletype mma") end,
})
