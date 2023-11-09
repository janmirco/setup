vim.g.indentLine_char = "▏"
vim.g.indentLine_enabled = 0

vim.keymap.set("n", "<A-i>", ":IndentLinesToggle<cr>", {silent = true})
