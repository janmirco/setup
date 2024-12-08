return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
                top_down = false,
            },
            quickfile = { enabled = true },
            terminal = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    wo = { wrap = true },
                },
            },
        },
        keys = {
            { ",,", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
            { ",h", function() Snacks.notifier.show_history() end, desc = "Notification History" },
            { "<A-m>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", mode = { "n", "t" } },
            { "]w", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
            { "[w", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
        },
    },
}
