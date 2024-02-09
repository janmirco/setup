return {
    { "folke/twilight.nvim" },
    {
        "folke/zen-mode.nvim",
        config = function()
            vim.keymap.set("n", "<A-z>", function()
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
                    plugins = {
                        options = {
                            enabled = true,
                            ruler = false,
                            showcmd = false,
                            laststatus = 0,
                        },
                        twilight = { enabled = true },
                        gitsigns = { enabled = true },
                        tmux = { enabled = true },
                    },
                    on_open = function() vim.opt.colorcolumn = "" end,
                })
            end, { silent = true })
        end,
    },
}
