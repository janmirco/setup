local latex_group = vim.api.nvim_create_augroup("LatexAugroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
    group = latex_group,
    pattern = { "*.bib", "*.tex" },
    callback = function()
        if vim.api.nvim_eval("&filetype") == "bib" then
            vim.cmd("syntax match bibText /{[^}]*}/ contains=@Spell")
            vim.cmd("syntax match bibText /\".*\"/ contains=@Spell")
        else
            vim.cmd("setfiletype tex")
        end

        vim.g.tex_flavor = "latex"
        vim.g.tex_nospell = 0
        vim.g.tex_comment_nospell = 0
        vim.g.tex_verbspell = 1
        vim.cmd("syntax spell toplevel")
    end,
})
