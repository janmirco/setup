return {
    "preservim/nerdcommenter",
    config = function()
        vim.g.NERDCreateDefaultMappings = 0
        vim.g.NERDSpaceDelims = 1
        vim.g.NERDRemoveExtraSpaces = 1
        vim.g.NERDDefaultAlign = "left"
        vim.g.NERDCommentEmptyLines = 1
        vim.g.NERDTrimTrailingWhitespace = 1
        vim.g.NERDToggleCheckAllLines = 1
        vim.g.NERDCustomDelimiters = {
            lua = {
                left = "--",
                leftAlt = "--", -- used for NERDCommenterToEOL
                right = "",
                rightAlt = "", -- used for NERDCommenterToEOL
            },
        }

        vim.keymap.set({ "n", "v" }, "<leader>cc", "<plug>NERDCommenterComment", { silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cu", "<plug>NERDCommenterUncomment", { silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cA", "<plug>NERDCommenterAppend", { silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>c$", "<plug>NERDCommenterToEOL", { silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>c<leader>", "<plug>NERDCommenterToggle", { silent = true })
    end,
}
