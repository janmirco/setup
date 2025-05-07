return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function()
            local noice = require("noice")
            noice.setup({
                lsp = {
                    progress = { enabled = false },
                    hover = { silent = true },
                    signature = { auto_open = { enabled = false } },
                },
                presets = {
                    command_palette = true,
                    lsp_doc_border = true,
                },
            })
            -- see also notifier keymaps in snacks.lua
            vim.keymap.set({ "n", "v" }, ",e", function() noice.cmd("errors") end, { desc = "Noice errors", silent = true })
            vim.keymap.set({ "n", "v" }, ",h", function() noice.cmd("history") end, { desc = "Noice history", silent = true })
            vim.keymap.set({ "n", "v" }, ",l", function() noice.cmd("last") end, { desc = "Noice last", silent = true })
            vim.keymap.set({ "n", "v" }, ",m", function() vim.cmd("messages") end, { desc = "Show old messages", silent = true })
            vim.keymap.set({ "n", "v" }, ",s", function() noice.cmd("stats") end, { desc = "Noice stats", silent = true })
            vim.keymap.set({ "n", "v" }, ",t", function() noice.cmd("telescope") end, { desc = "Noice telescope", silent = true })
        end,
    },
}
