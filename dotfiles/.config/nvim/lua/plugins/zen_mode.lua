local zen_mode_toggle = function()
    require("zen-mode").toggle({
        window = {
            options = {
                signcolumn = "no",
                number = false,
                relativenumber = false,
                cursorline = false,
                cursorcolumn = false,
                foldcolumn = "0",
                list = false,
            },
        },
    })
end

vim.keymap.set("n", "<A-s>", zen_mode_toggle, {silent = true})
