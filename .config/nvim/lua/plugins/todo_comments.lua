return {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        local todo_comments = require("todo-comments")
        todo_comments.setup({ highlight = { comments_only = false } })
        vim.keymap.set("n", "[t", function()
            todo_comments.jump_prev()
            vim.cmd("normal zz")
        end, { desc = "[Todo] Previous comment", silent = true })
        vim.keymap.set("n", "]t", function()
            todo_comments.jump_next()
            vim.cmd("normal zz")
        end, { desc = "[Todo] Next comment", silent = true })
        vim.keymap.set("n", "tdt", function() vim.cmd("TodoTrouble") end, { desc = "Open using Trouble", silent = true })
        vim.keymap.set("n", "tdc", function() vim.cmd("TodoTelescope") end, { desc = "Open using Telescope", silent = true })
    end,
}
