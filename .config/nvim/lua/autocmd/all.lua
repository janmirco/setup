local all_group = vim.api.nvim_create_augroup("AllAugroup", { clear = true })

vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "BufNew", "BufNewFile", "BufRead", "BufWinEnter", "FileType" }, {
    group = all_group,
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
        vim.opt_local.colorcolumn = { 81, 161 }
        vim.opt_local.cursorline = true

        -- Disable colorcolumn and cursorline for specific filetypes
        local excluded_filetypes = {
            "alpha",
            "cmp",
            "dashboard",
            "float",
            "lazy",
            "man",
            "mason",
            "neo-tree",
            "neogit",
            "noice",
            "notify",
            "oil",
            "snacks_dashboard",
            "telescope",
            "whichkey",
        }
        for _, excluded_filetype in ipairs(excluded_filetypes) do
            if vim.bo.filetype:lower():find(excluded_filetype) then
                vim.opt_local.colorcolumn = ""
                vim.opt_local.cursorline = false
                return
            end
        end

        -- Enable spell and set custom colorcolumn for version control messages
        local version_control_filetypes = {
            "gitcommit",
            "neogitcommitmessage",
            "jjdescription",
        }
        for _, version_control_filetype in ipairs(version_control_filetypes) do
            if vim.bo.filetype:lower():find(version_control_filetype) then
                vim.opt_local.colorcolumn = { 51, 73 }
                vim.opt_local.cursorline = true
                vim.opt_local.spelllang = "en_us"
                vim.opt_local.spell = true
                return
            end
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})
