return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<A-z>", function()
            require("zen-mode").toggle({
                window = {
                    width = 0.95,
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
                on_open = function(_) vim.cmd("set colorcolumn=") end,
            })
        end, { silent = true })
    end,
}
