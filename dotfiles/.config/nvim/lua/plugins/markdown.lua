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
                -- for most of the following mappings, see ./which_key.lua
                mappings = {
                    MkdnEnter = { { "n", "v" }, "<cr>" },
                    MkdnTab = false,
                    MkdnSTab = false,
                    MkdnNextLink = { "n", "]l" },
                    MkdnPrevLink = { "n", "[l" },
                    MkdnNextHeading = { "n", "]]" },
                    MkdnPrevHeading = { "n", "[[" },
                    MkdnGoBack = false,
                    MkdnGoForward = false,
                    MkdnCreateLink = false,
                    MkdnCreateLinkFromClipboard = { { "n", "v" }, "mp" },
                    MkdnFollowLink = false,
                    MkdnDestroyLink = { { "n", "v" }, "<A-cr>" },
                    MkdnTagSpan = { "v", "ms" },
                    MkdnMoveSource = { "n", "mr" },
                    MkdnYankAnchorLink = { "n", "mya" },
                    MkdnYankFileAnchorLink = { "n", "myf" },
                    MkdnIncreaseHeading = { "n", "mj" },
                    MkdnDecreaseHeading = { "n", "mk" },
                    MkdnToggleToDo = { { "n", "v" }, "mt" },
                    MkdnNewListItem = false,
                    MkdnNewListItemBelowInsert = { "n", "o" },
                    MkdnNewListItemAboveInsert = { "n", "O" },
                    MkdnExtendList = false,
                    MkdnUpdateNumbering = { "n", "mn" },
                    MkdnTableNextCell = false,
                    MkdnTablePrevCell = false,
                    MkdnTableNextRow = false,
                    MkdnTablePrevRow = false,
                    MkdnTableNewRowBelow = false,
                    MkdnTableNewRowAbove = false,
                    MkdnTableNewColAfter = false,
                    MkdnTableNewColBefore = false,
                    MkdnFoldSection = { "n", "mf" },
                    MkdnUnfoldSection = { "n", "mF" },
                },
            })
        end,
    },
}
