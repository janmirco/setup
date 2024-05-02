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
            "man",
            "mason",
            "neo-tree",
            "neogit",
            "alpha",
            "noice",
            "notify",
            "oil",
            "telescope",
            "whichkey",
        }
        for _, filetype in ipairs(filetypes) do
            local current_filetype = vim.api.nvim_eval("&filetype")

            if string.find(string.lower(current_filetype), filetype) then
                vim.opt.colorcolumn = ""
                vim.opt.cursorline = false
            end

            -- special settings for Neogit commit messages
            if string.find(string.lower(current_filetype), "neogitcommitmessage") then
                vim.opt.colorcolumn = { 51, 73 }
                vim.opt.cursorline = true
                vim.cmd("setlocal spell spelllang=en_us")
            end
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})
