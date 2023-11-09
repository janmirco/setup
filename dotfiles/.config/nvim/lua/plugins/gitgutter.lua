vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_highlight_linenrs = 1

vim.keymap.set("n", "<A-g>", ":GitGutterToggle<cr>:echo '[GitGutter] Toggle'<cr>", {silent = true})
vim.keymap.set("n", "<leader>k", ":GitGutterPrevHunk<cr>zz", {silent = true})
vim.keymap.set("n", "<leader>j", ":GitGutterNextHunk<cr>zz", {silent = true})
vim.keymap.set("n", "gp", ":GitGutterPreviewHunk<cr>", {silent = true})
vim.keymap.set("n", "gu", ":GitGutterUndoHunk<cr>", {silent = true})
vim.keymap.set("n", "gh", ":GitGutterStageHunk<cr>", {silent = true})
