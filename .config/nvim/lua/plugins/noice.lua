return {
    {
        "rcarriga/nvim-notify",
        opts = {
            timeout = 3000,
            render = "default",
            top_down = false,
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function()
            local noice = require("noice")
            noice.setup({
                lsp = {
                    progress = { enabled = false },
                    signature = { auto_open = { enabled = false } },
                },
                presets = {
                    command_palette = true,
                    lsp_doc_border = true,
                },
            })
            vim.keymap.set({ "n", "v" }, ",,", function() noice.cmd("dismiss") end, { desc = "Dismiss visible messages", silent = true })
            vim.keymap.set({ "n", "v" }, ",t", function() noice.cmd("telescope") end, { desc = "Find message in history", silent = true })
            vim.keymap.set({ "n", "v" }, ",h", function() noice.cmd("history") end, { desc = "Open history", silent = true })
            vim.keymap.set({ "n", "v" }, ",l", function() noice.cmd("last") end, { desc = "Show last message", silent = true })
        end,
    },
}
