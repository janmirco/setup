return {
    {
        "airblade/vim-gitgutter",
        config = function()
            vim.g.gitgutter_enabled = 1
            vim.g.gitgutter_map_keys = 0
            vim.g.gitgutter_highlight_linenrs = 1

            vim.keymap.set("n", "<A-g>", ":GitGutterToggle<cr>:echo '[GitGutter] Toggle'<cr>", { silent = true })
            vim.keymap.set("n", "[g", ":GitGutterPrevHunk<cr>zz", { silent = true })
            vim.keymap.set("n", "]g", ":GitGutterNextHunk<cr>zz", { silent = true })
            vim.keymap.set("n", "gp", ":GitGutterPreviewHunk<cr>", { silent = true })
            vim.keymap.set("n", "gu", ":GitGutterUndoHunk<cr>", { silent = true })
            vim.keymap.set("n", "gh", ":GitGutterStageHunk<cr>", { silent = true })
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "gs", ":Git<cr>", { silent = true })
            vim.keymap.set("n", "gl", ":Git log --all --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --format=format:'%h [%ci] %an%  -> %s %d'<cr>", { silent = true })
            vim.keymap.set("n", "gL", ":Git log --all --date-order --branches --remotes --tags --graph --decorate<cr>", { silent = true })
            vim.keymap.set("n", "gc", ":Git commit<cr>", { silent = true })
            vim.keymap.set("n", "gw", ":Git show ", { silent = true })
            vim.keymap.set("n", "gw1", ":Git show HEAD~0<cr>", { silent = true })
            vim.keymap.set("n", "gw2", ":Git show HEAD~1<cr>", { silent = true })
            vim.keymap.set("n", "gw3", ":Git show HEAD~2<cr>", { silent = true })
            vim.keymap.set("n", "gP", ":Git push<cr>", { silent = true })
            vim.keymap.set("n", "gb", ":Git blame<cr>", { silent = true })
            vim.keymap.set("n", "gv", ":Gvdiffsplit<cr>", { silent = true })
            vim.keymap.set("n", "gm", ":Gvdiffsplit!<cr>", { silent = true })
            vim.keymap.set("n", "g,", ":diffget //2<cr>:echo '[GitMerge] Grabbed from left side'<cr>", { silent = true })
            vim.keymap.set("n", "g.", ":diffget //3<cr>:echo '[GitMerge] Grabbed from right side'<cr>", { silent = true })
        end,
    },
}
