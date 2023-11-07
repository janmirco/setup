-- exit terminal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", {silent = true})
vim.keymap.set("t", "<A-m>", "<cmd>FloatermToggle<cr>", {silent = true})


-- move between windows
vim.keymap.set("t", "<C-h>", "<cmd>wincmd h<cr>", {silent = true})
vim.keymap.set("t", "<C-j>", "<cmd>wincmd j<cr>", {silent = true})
vim.keymap.set("t", "<C-k>", "<cmd>wincmd k<cr>", {silent = true})
vim.keymap.set("t", "<C-l>", "<cmd>wincmd l<cr>", {silent = true})
