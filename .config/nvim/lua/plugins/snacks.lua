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
                        { icon = "󰒲 ", key = "l", desc = "Lazy Update", action = ":Lazy update" },
                        { icon = "󰐅 ", key = "t", desc = "Treesitter Update Parsers", action = ":TSUpdate" },
                        { icon = "󱁤 ", key = "m", desc = "Mason Update Registries", action = ":MasonUpdate" },
                        { icon = "󱁤 ", key = "M", desc = "Mason Open", action = ":Mason" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qall" },
                    },
                },
                formats = {
                    key = function(item) return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } } end,
                    icon = function(item)
                        -- The following setting is necessary because snacks is
                        -- not displaying icons for files without extensions
                        -- like .bashrc, Makefile, and so on. This may be fixed
                        -- in a future release of snacks and can be removed.

                        local icon = item.icon
                        local icon_hl = "icon"

                        -- Make sure to only use devicons when item is a file.
                        -- This preserves icons for bookmarks.
                        if item.icon == "file" then
                            local filename = vim.fn.fnamemodify(item.file, ":t")
                            local extension = vim.fn.fnamemodify(item.file, ":e")
                            local devicons = require("nvim-web-devicons")
                            icon, icon_hl = devicons.get_icon(filename, extension, { default = true })
                        end

                        return { icon, width = 2, hl = icon_hl }
                    end,
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
            input = { enabled = true },
            lazygit = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
                top_down = false,
            },
            quickfile = { enabled = true },
            scope = {
                enabled = true,
                keys = {
                    jump = {
                        ["]p"] = { -- default is ]i
                            bottom = true,
                            desc = "Jump to bottom of scope",
                        },
                        ["[p"] = { -- default is [i
                            bottom = false,
                            desc = "Jump to top of scope",
                        },
                    },
                },
            },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
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
            { "]w", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t", "v" } },
            { "[w", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t", "v" } },
        },
    },
}
