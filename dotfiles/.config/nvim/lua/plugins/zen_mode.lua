local zen_mode_toggle = function()
    require("zen-mode").toggle({
        window = {
            width = 0.67,
            height = 1.0,
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
        plugins = {
            options = {
                enabled = true,
                ruler = false,
                showcmd = false,
                laststatus = 0,
            },
        },
        on_open = function(_)
            vim.cmd("set colorcolumn=")
        end,
    })
end

vim.keymap.set("n", "<A-z>", zen_mode_toggle, {silent = true})
