local matlab_group = vim.api.nvim_create_augroup("MatlabAugroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
    group = matlab_group,
    pattern = "*.m",
    callback = function()
        vim.cmd("setfiletype matlab")
        vim.cmd("set commentstring=%%s")

        -- vim.keymap.set("n", "gd", "yiw:vimgrep function.*<C-r>\" ./.**/*.m<cr>/<C-r>\"<cr>", { desc = "[LSP] Go to definition", silent = true })
        vim.keymap.set("n", "gd", ":! ctags -R .<cr><cr><C-]>:! rm -f tags<cr><cr>", { desc = "[LSP] Go to definition", silent = true })
    end,
})
