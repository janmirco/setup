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
            "cmp",
            "dashboard",
            "mason",
            "notify",
            "telescope",
        }
        for _, filetype in ipairs(filetypes) do
            local current_filetype = vim.api.nvim_eval("&filetype")
            if string.find(string.lower(current_filetype), filetype) then
                vim.opt.colorcolumn = ""
                vim.opt.cursorline = false
            end
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})
