-- exit insert mode
local exit_insert_mode = function()
    local _, column = unpack(vim.api.nvim_win_get_cursor(0))
    if column == 0 then
        vim.cmd("stopinsert")
    else
        vim.cmd("stopinsert")
        vim.cmd("normal l")
    end
end
vim.keymap.set("i", "hh", exit_insert_mode)

-- paste commands from normal mode
vim.keymap.set("i", "<A-p>", "<Esc>:normal p<cr>i")
vim.keymap.set("i", "<A-P>", "<Esc>:normal P<cr>i")
