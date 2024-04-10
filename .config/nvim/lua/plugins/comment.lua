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

        vim.keymap.set({ "n", "v" }, "<leader>c$", "<plug>NERDCommenterToEOL", { desc = "ToEOL", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>c<leader>", "<plug>NERDCommenterToggle", { desc = "Toggle", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cA", "<plug>NERDCommenterAppend", { desc = "Append", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>ca", "<plug>NERDCommenterAltDelims", { desc = "AltDelims", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cb", "<plug>NERDCommenterAlignBoth", { desc = "AlignBoth", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cc", "<plug>NERDCommenterComment", { desc = "Comment", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>ci", "<plug>NERDCommenterInvert", { desc = "Invert", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cl", "<plug>NERDCommenterAlignLeft", { desc = "AlignLeft", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cm", "<plug>NERDCommenterMinimal", { desc = "Minimal", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cn", "<plug>NERDCommenterNested", { desc = "Nested", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cs", "<plug>NERDCommenterSexy", { desc = "Sexy", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>ct", "<plug>NERDCommenterToggle", { desc = "Toggle", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cu", "<plug>NERDCommenterUncomment", { desc = "Uncomment", silent = true })
        vim.keymap.set({ "n", "v" }, "<leader>cy", "<plug>NERDCommenterYank", { desc = "Yank", silent = true })
    end,
}
