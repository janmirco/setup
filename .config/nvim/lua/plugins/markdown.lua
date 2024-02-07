return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_theme = "light"
            vim.keymap.set("n", "<A-p>", "<Plug>MarkdownPreview", { silent = true })
        end,
    },
    {
        "jakewvincent/mkdnflow.nvim",
        ft = "markdown",
        config = function()
            require("mkdnflow").setup({
                modules = {
                    maps = false, -- set keymaps explicitly below
                    yaml = true,
                    cmp = false, -- currently only working with perspective.priority = "root"
                },
                perspective = {
                    priority = "current",
                },
                links = {
                    conceal = true,
                    transform_explicit = function(text) return text:gsub(" ", "_") end,
                },
                to_do = {
                    symbols = { " ", "x", " " },
                },
            })

            vim.keymap.set("n", "mf", function() vim.cmd("MkdnFoldSection") end, { desc = "FoldSection", silent = true })
            vim.keymap.set("n", "mF", function() vim.cmd("MkdnUnfoldSection") end, { desc = "UnfoldSection", silent = true })
            vim.keymap.set("n", "mj", function() vim.cmd("MkdnIncreaseHeading") end, { desc = "IncreaseHeading", silent = true })
            vim.keymap.set("n", "mk", function() vim.cmd("MkdnDecreaseHeading") end, { desc = "DecreaseHeading", silent = true })
            vim.keymap.set("n", "mn", function() vim.cmd("MkdnUpdateNumbering") end, { desc = "UpdateNumbering", silent = true })
            vim.keymap.set("n", "mr", function() vim.cmd("MkdnMoveSource") end, { desc = "MoveSource", silent = true })
            vim.keymap.set("n", "ms", function() vim.cmd("MkdnTagSpan") end, { desc = "TagSpan", silent = true })
            vim.keymap.set("n", "mt", function() vim.cmd("MkdnToggleToDo") end, { desc = "ToggleToDo", silent = true })
            vim.keymap.set("n", "mya", function() vim.cmd("MkdnYankAnchorLink") end, { desc = "YankAnchorLink", silent = true })
            vim.keymap.set("n", "myf", function() vim.cmd("MkdnYankFileAnchorLink") end, { desc = "YankFileAnchorLink", silent = true })
            vim.keymap.set("n", "O", function() vim.cmd("MkdnNewListItemAboveInsert") end, { desc = "[Mkdnflow] NewListItemAboveInsert", silent = true })
            vim.keymap.set("n", "o", function() vim.cmd("MkdnNewListItemBelowInsert") end, { desc = "[Mkdnflow] NewListItemBelowInsert", silent = true })
            vim.keymap.set({ "n", "v" }, "<A-cr>", function() vim.cmd("MkdnDestroyLink") end, { desc = "[Mkdnflow] DestroyLink", silent = true })
            vim.keymap.set({ "n", "v" }, "<cr>", function() vim.cmd("MkdnEnter") end, { desc = "[Mkdnflow] Enter", silent = true })
            vim.keymap.set({ "n", "v" }, "mp", function() vim.cmd("MkdnCreateLinkFromClipboard") end, { desc = "[Mkdnflow] CreateLinkFromClipboard", silent = true })

            -- make sections italic/bold
            vim.keymap.set("n", "mi", function()
                local keys = vim.api.nvim_replace_termcodes("ciw*<C-r>\"*<esc>b", true, false, true)
                vim.api.nvim_feedkeys(keys, "n", true)
            end, { desc = "Make italic", silent = true })
            vim.keymap.set("n", "mb", function()
                local keys = vim.api.nvim_replace_termcodes("ciw**<C-r>\"**<esc>bb", true, false, true)
                vim.api.nvim_feedkeys(keys, "n", true)
            end, { desc = "Make bold", silent = true })
            vim.keymap.set("v", "mi", function()
                local keys = vim.api.nvim_replace_termcodes("c*<C-r>\"*<esc>b", true, false, true)
                vim.api.nvim_feedkeys(keys, "v", true)
            end, { desc = "[Mkdnflow] Make italic", silent = true })
            vim.keymap.set("v", "mb", function()
                local keys = vim.api.nvim_replace_termcodes("c**<C-r>\"**<esc>bb", true, false, true)
                vim.api.nvim_feedkeys(keys, "v", true)
            end, { desc = "[Mkdnflow] Make bold", silent = true })

            -- remove italic/bold by using tpope/vim-surround together with tpope/vim-repeat:
            --   italic: ds*
            --   bold: ds*.
            --   bold italic: ds*..

            -- jump commands
            vim.keymap.set("n", "]h", function()
                vim.cmd("MkdnNextHeading")
                vim.cmd("normal zz")
            end, { desc = "[Mkdnflow] Next header", silent = true })
            vim.keymap.set("n", "[h", function()
                vim.cmd("MkdnPrevHeading")
                vim.cmd("normal zz")
            end, { desc = "[Mkdnflow] Previous header", silent = true })
            vim.keymap.set("n", "]l", function()
                vim.cmd("MkdnNextLink")
                vim.cmd("normal zz")
            end, { desc = "[Mkdnflow] Next link", silent = true })
            vim.keymap.set("n", "[l", function()
                vim.cmd("MkdnPrevLink")
                vim.cmd("normal zz")
            end, { desc = "[Mkdnflow] Previous link", silent = true })
        end,
    },
}
