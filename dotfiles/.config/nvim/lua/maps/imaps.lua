-- exit insert mode
local exit_insert_mode = function()
    local row, column = unpack(vim.api.nvim_win_get_cursor(0))
    local at_line_start = column == 0
    if at_line_start then
        vim.cmd("stopinsert")
    else
        vim.cmd("stopinsert")
        local keys = vim.api.nvim_replace_termcodes("l", true, false, true)
        vim.api.nvim_feedkeys(keys, "n", true)
    end
end
vim.keymap.set("i", "hh", exit_insert_mode)


-- parentheses, brackets, curly braces, single/double quotation marks, ...
vim.keymap.set("i", "( ", "()<left>")
vim.keymap.set("i", "[ ", "[]<left>")
vim.keymap.set("i", "{ ", "{}<left>")
vim.keymap.set("i", "' ", "''<left>")
vim.keymap.set("i", "\" ", "\"\"<left>")
vim.keymap.set("i", "` ", "``<left>")
vim.keymap.set("i", "< ", "<><left>")
vim.keymap.set("i", "(<cr>", "()<left><cr>")
vim.keymap.set("i", "[<cr>", "[]<left><cr>")
vim.keymap.set("i", "{<cr>", "{}<left><cr>")


-- paste commands from normal mode
vim.keymap.set("i", "<A-p>", "<Esc>:normal p<cr>i")
vim.keymap.set("i", "<A-P>", "<Esc>:normal P<cr>i")


-- latex
vim.keymap.set("i", "<A-a>", "{\\\"a}")
vim.keymap.set("i", "<A-A>", "{\\\"A}")
vim.keymap.set("i", "<A-o>", "{\\\"o}")
vim.keymap.set("i", "<A-O>", "{\\\"O}")
vim.keymap.set("i", "<A-u>", "{\\\"u}")
vim.keymap.set("i", "<A-U>", "{\\\"U}")
vim.keymap.set("i", "<A-s>", "{\\ss}")
