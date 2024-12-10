return {
    {
        "folke/snacks.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    keys = {
                        { icon = " ", key = "e", desc = "New File", action = ":enew" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qall" },
                    },
                },
                formats = {
                    key = function(item) return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } } end,
                },
                sections = {
                    { section = "header" },
                    { title = "Bookmarks", padding = 1 },
                    { section = "keys", padding = 1 },
                    { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
                    { section = "recent_files", cwd = true, limit = 5, padding = 1 },
                    { title = "MRU", padding = 1 },
                    { section = "recent_files", limit = 5, padding = 1 },
                },
            },
            lazygit = { enabled = true },
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
            {
                "<A-a>",
                function()
                    if vim.api.nvim_eval("&filetype") == "snacks_dashboard" then
                        vim.cmd("bdelete")
                    else
                        Snacks.dashboard.open()
                    end
                end,
                desc = "Dashboard",
            },
            { "LG", function() Snacks.lazygit.open() end, desc = "Lazygit" },
            { "LL", function() Snacks.lazygit.log() end, desc = "Lazygit Current File History" },
            { ",,", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
            { ",h", function() Snacks.notifier.show_history() end, desc = "Notification History" },
            { "<A-m>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", mode = { "n", "t" } },
            { "]w", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
            { "[w", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
        },
    },
}
