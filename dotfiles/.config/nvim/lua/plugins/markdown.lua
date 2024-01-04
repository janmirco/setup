return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_theme = "light"
            vim.keymap.set("n", "<A-p>", "<Plug>MarkdownPreview", { silent = true })
        end,
    },
    {
        "jakewvincent/mkdnflow.nvim",
        config = function()
            require("mkdnflow").setup({
                perspective = {
                    priority = "current",
                },
                links = {
                    conceal = true,
                    transform_explicit = function(text) return text:gsub(" ", "_") end,
                },
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
                    MkdnDestroyLink = { "n", "<A-cr>" },
                    MkdnTagSpan = false,
                    MkdnMoveSource = { "n", "mr" },
                    MkdnYankAnchorLink = false,
                    MkdnYankFileAnchorLink = false,
                    MkdnIncreaseHeading = false,
                    MkdnDecreaseHeading = false,
                    MkdnToggleToDo = { { "n", "v" }, "mt" },
                    MkdnNewListItem = false,
                    MkdnNewListItemBelowInsert = false,
                    MkdnNewListItemAboveInsert = false,
                    MkdnExtendList = false,
                    MkdnUpdateNumbering = false,
                    MkdnTableNextCell = false,
                    MkdnTablePrevCell = false,
                    MkdnTableNextRow = false,
                    MkdnTablePrevRow = false,
                    MkdnTableNewRowBelow = false,
                    MkdnTableNewRowAbove = false,
                    MkdnTableNewColAfter = false,
                    MkdnTableNewColBefore = false,
                    MkdnFoldSection = false,
                    MkdnUnfoldSection = false,
                },
            })
        end,
    },
}
