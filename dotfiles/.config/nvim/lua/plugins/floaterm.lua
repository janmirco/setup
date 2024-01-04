return {
    "voldikss/vim-floaterm",
    config = function()
        vim.g.floaterm_autoinsert = true
        vim.g.floaterm_autoclose = 2
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_title = ""
        vim.keymap.set("n", "<A-m>", ":FloatermToggle<cr>", { silent = true })
    end,
}
