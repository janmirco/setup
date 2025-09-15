return {
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "1.*",
        config = function()
            require("typst-preview").setup({
                open_cmd = "chromium %s",
            })
            vim.keymap.set("n", "<A-p>", "<cmd>TypstPreview<cr>", { silent = true })

            -- make sections italic/bold
            vim.keymap.set("n", "mi", function()
                local keys = vim.api.nvim_replace_termcodes("ciw_<C-r>\"_<esc>b", true, false, true)
                vim.api.nvim_feedkeys(keys, "n", true)
            end, { desc = "Make italic", silent = true })
            vim.keymap.set("n", "mb", function()
                local keys = vim.api.nvim_replace_termcodes("ciw*<C-r>\"*<esc>bb", true, false, true)
                vim.api.nvim_feedkeys(keys, "n", true)
            end, { desc = "Make bold", silent = true })
            vim.keymap.set("v", "mi", function()
                local keys = vim.api.nvim_replace_termcodes("c_<C-r>\"_<esc>b", true, false, true)
                vim.api.nvim_feedkeys(keys, "v", true)
            end, { desc = "Make italic", silent = true })
            vim.keymap.set("v", "mb", function()
                local keys = vim.api.nvim_replace_termcodes("c*<C-r>\"*<esc>bb", true, false, true)
                vim.api.nvim_feedkeys(keys, "v", true)
            end, { desc = "Make bold", silent = true })
            -- remove italic/bold by using tpope/vim-surround together with tpope/vim-repeat:
            --   italic: ds_
            --   bold: ds*
        end,
    },
}
