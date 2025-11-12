local all_group = vim.api.nvim_create_augroup("AllAugroup", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    group = all_group,
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" }) -- this has to be called via opt_local from here!

        -- Remove any fold appearance changes and open all folds
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.fillchars = { fold = " ", eob = " " }
        vim.opt_local.foldtext = ""
        vim.cmd("highlight Folded guibg=normal")
        vim.cmd("normal! zR")

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
            "snacks_notif_history",
            "telescope",
            "whichkey",
        }
        for _, excluded_filetype in ipairs(excluded_filetypes) do
            if vim.bo.filetype:lower():find(excluded_filetype) then
                vim.opt_local.colorcolumn = ""
                vim.opt_local.cursorline = false
                vim.opt_local.conceallevel = 0
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
