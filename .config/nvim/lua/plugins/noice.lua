return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
        local noice = require("noice")
        noice.setup()
        vim.keymap.set("n", ",,", function() noice.cmd("dismiss") end, { desc = "Dismiss visible messages", silent = true })
        vim.keymap.set("n", ",t", function() noice.cmd("telescope") end, { desc = "Find message in history", silent = true })
        vim.keymap.set("n", ",h", function() noice.cmd("history") end, { desc = "Open history", silent = true })
        vim.keymap.set("n", ",l", function() noice.cmd("last") end, { desc = "Show last message", silent = true })
    end,
}
