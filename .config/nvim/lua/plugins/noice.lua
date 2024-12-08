return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
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
            -- see snacks.lua for dismiss and history commands
            vim.keymap.set({ "n", "v" }, ",t", function() noice.cmd("telescope") end, { desc = "Find message in history", silent = true })
            vim.keymap.set({ "n", "v" }, ",l", function() noice.cmd("last") end, { desc = "Show last message", silent = true })
        end,
    },
}
