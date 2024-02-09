local latex_group = vim.api.nvim_create_augroup("LatexAugroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
    group = latex_group,
    pattern = "*.tex",
    callback = function()
        vim.cmd("setfiletype tex")
        vim.g.tex_flavor = "latex"
        vim.g.tex_nospell = 0
        vim.g.tex_comment_nospell = 0
        vim.g.tex_verbspell = 1
        vim.cmd("syntax spell toplevel")
    end,
})
