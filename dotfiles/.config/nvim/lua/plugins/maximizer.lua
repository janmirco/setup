vim.g.maximizer_set_default_mapping = 0

vim.keymap.set("n", "<A-x>", ":MaximizerToggle<cr>", {silent = true})
vim.keymap.set("v", "<A-x>", ":MaximizerToggle<cr>gV", {silent = true, remap = true})
vim.keymap.set("i", "<A-x>", "<C-o>:MaximizerToggle<cr>", {silent = true})
