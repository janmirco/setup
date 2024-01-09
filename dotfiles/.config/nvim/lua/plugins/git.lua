return {
    {
        "airblade/vim-gitgutter",
        config = function()
            vim.g.gitgutter_enabled = 1
            vim.g.gitgutter_map_keys = 0
            vim.g.gitgutter_highlight_linenrs = 1

            vim.keymap.set("n", "<A-g>", ":GitGutterToggle<cr>:echo '[GitGutter] Toggle'<cr>", { desc = "[Git] Toggle gitgutter", silent = true })
            vim.keymap.set("n", "[g", ":GitGutterPrevHunk<cr>zz", { desc = "[Git] Previous hunk", silent = true })
            vim.keymap.set("n", "]g", ":GitGutterNextHunk<cr>zz", { desc = "[Git] Next hunk", silent = true })
            vim.keymap.set("n", "gp", ":GitGutterPreviewHunk<cr>", { desc = "[Git] Preview hunk", silent = true })
            vim.keymap.set("n", "gu", ":GitGutterUndoHunk<cr>", { desc = "[Git] Undo hunk", silent = true })
            vim.keymap.set("n", "gh", ":GitGutterStageHunk<cr>", { desc = "[Git] Stage hunk", silent = true })
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "g,", ":diffget //2<cr>:echo '[GitMerge] Grabbed from left side'<cr>", { desc = "[Git] Diffget from left", silent = true })
            vim.keymap.set("n", "g.", ":diffget //3<cr>:echo '[GitMerge] Grabbed from right side'<cr>", { desc = "[Git] Diffget from right", silent = true })
            vim.keymap.set("n", "gF", ":Git diff<cr>", { desc = "[Git] Diff", silent = true })
            vim.keymap.set("n", "gL", ":Git log --all --date-order --branches --remotes --tags --graph --decorate<cr>", { desc = "[Git] Log all WITHOUT format", silent = true })
            vim.keymap.set("n", "gP", ":Git push<cr>", { desc = "[Git] Push", silent = true })
            vim.keymap.set("n", "gb", ":Git blame<cr>", { desc = "[Git] Blame", silent = true })
            vim.keymap.set("n", "gc", ":Git commit<cr>", { desc = "[Git] Commit", silent = true })
            vim.keymap.set("n", "gl", ":Git log --all --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --format=format:'%h [%ci] %an%  -> %s %d'<cr>", { desc = "[Git] Log all", silent = true })
            vim.keymap.set("n", "gm", ":Gvdiffsplit!<cr>", { desc = "[Git] Vertical diff split (retaining focus)", silent = true })
            vim.keymap.set("n", "gs", ":Git<cr>", { desc = "[Git] Status", silent = true })
            vim.keymap.set("n", "gv", ":Gvdiffsplit<cr>", { desc = "[Git] Vertical diff split", silent = true })
            vim.keymap.set("n", "gw1", ":Git show HEAD~0<cr>", { desc = "Latest", silent = true })
            vim.keymap.set("n", "gw2", ":Git show HEAD~1<cr>", { desc = "Second latest", silent = true })
            vim.keymap.set("n", "gw3", ":Git show HEAD~2<cr>", { desc = "Third latest", silent = true })
            vim.keymap.set("n", "gw4", ":Git show HEAD~3<cr>", { desc = "Fourth latest", silent = true })
            vim.keymap.set("n", "gw5", ":Git show HEAD~4<cr>", { desc = "Fifth latest", silent = true })
            vim.keymap.set("n", "gww", ":Git show ", { desc = "Enter hash", silent = true })
        end,
    },
}
