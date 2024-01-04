return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local lazy = require("lazy")
        local telescope_builtin = require("telescope.builtin")

        require("dashboard").setup({
            theme = "hyper",
            shortcut_type = "number",
            config = {
                week_header = { enable = true },
                shortcut = {
                    { desc = "New file", group = "Number", action = function() vim.cmd("enew") end, key = "e" },
                    { desc = "Update mason", group = "Number", action = function() vim.cmd("MasonUpdate") end, key = "U" },
                    { desc = "Update plugins", group = "Number", action = function() lazy.update({ wait = true }) end, key = "u" },
                    { desc = "Restore plugins", group = "Number", action = function() lazy.restore({ wait = true }) end, key = "r" },
                    { desc = "Find files", group = "Number", action = function() telescope_builtin.find_files({ hidden = true, no_ignore = true }) end, key = "f" },
                    { desc = "Find home", group = "Number", action = function() telescope_builtin.find_files({ hidden = true, no_ignore = true, cwd = vim.env.HOME }) end, key = "h" },
                    { desc = "Find nvim", group = "Number", action = function() telescope_builtin.find_files({ hidden = true, no_ignore = true, cwd = vim.fn.stdpath("config") }) end, key = "n" },
                    { desc = "Live grep", group = "Number", action = function() telescope_builtin.live_grep() end, key = "l" },
                    {
                        desc = "Close all",
                        group = "Number",
                        action = function()
                            vim.cmd("wall")
                            vim.cmd("qall")
                        end,
                        key = "a",
                    },
                },
                packages = { enable = false },
                project = { enable = false },
                mru = { limit = 9, cwd_only = false },
                footer = {},
            },
        })

        vim.keymap.set("n", "<A-a>", ":Dashboard<cr>", { silent = true })
    end,
}
