local all_group = vim.api.nvim_create_augroup("AllAugroup", { clear = true })

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
    group = all_group,
    pattern = "*",
    callback = function()
        vim.opt.formatoptions = { c = false, r = false, o = false }
        vim.opt.colorcolumn = { 81, 161 }
        vim.opt.cursorline = true

        -- disable colorcolumn and cursorline for specific filetypes
        local filetypes = {
            "cmp_docs",
            "cmp_menu",
            "dashboard",
            "notify",
            "TelescopePrompt",
            "TelescopePromptBorder",
        }
        for _, filetype in ipairs(filetypes) do
            if vim.api.nvim_eval("&filetype") == filetype then
                vim.opt.colorcolumn = ""
                vim.opt.cursorline = false
            end
        end
    end,
})
