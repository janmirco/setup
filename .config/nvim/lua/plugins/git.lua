return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require("gitsigns")
            gitsigns.setup({ attach_to_untracked = true })

            -- normal mode keymaps
            vim.keymap.set("n", "<A-g>", gitsigns.toggle_signs, { desc = "[Git] Toggle gitsigns", silent = true })
            vim.keymap.set("n", "[g", function()
                gitsigns.prev_hunk()
                vim.cmd("normal zz")
            end, { desc = "[Git] Previous hunk", silent = true })
            vim.keymap.set("n", "]g", function()
                gitsigns.next_hunk()
                vim.cmd("normal zz")
            end, { desc = "[Git] Next hunk", silent = true })
            vim.keymap.set("n", "gU", gitsigns.undo_stage_hunk, { desc = "[Git] Undo last stage", silent = true })
            vim.keymap.set("n", "gb", gitsigns.blame_line, { desc = "[Git] Blame line", silent = true })
            vim.keymap.set("n", "ge", gitsigns.toggle_deleted, { desc = "[Git] Toggle deleted", silent = true })
            vim.keymap.set("n", "ghb", gitsigns.stage_buffer, { desc = "Buffer", silent = true })
            vim.keymap.set("n", "ghh", gitsigns.stage_hunk, { desc = "Hunk", silent = true })
            vim.keymap.set("n", "ghl", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line(".") }) end, { desc = "Line", silent = true })
            vim.keymap.set("n", "gp", gitsigns.preview_hunk, { desc = "[Git] Preview hunk", silent = true })
            vim.keymap.set("n", "gub", gitsigns.reset_buffer, { desc = "Buffer", silent = true })
            vim.keymap.set("n", "guh", gitsigns.reset_hunk, { desc = "Hunk", silent = true })
            vim.keymap.set("n", "gul", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line(".") }) end, { desc = "Line", silent = true })
            vim.keymap.set("n", "guu", gitsigns.reset_hunk, { desc = "Hunk", silent = true })

            -- visual mode keymaps
            vim.keymap.set("v", "gh", function() gitsigns.stage_hunk({ vim.fn.line("v"), vim.fn.line(".") }) end, { desc = "[Git] Stage lines", silent = true })
            vim.keymap.set("v", "gu", function() gitsigns.reset_hunk({ vim.fn.line("v"), vim.fn.line(".") }) end, { desc = "[Git] Undo lines", silent = true })
        end,
    },
    {
        "NeogitOrg/neogit",
        branch = "nightly",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            local neogit = require("neogit")
            neogit.setup()
            vim.keymap.set("n", "gc", function() neogit.open({ "commit" }) end, { desc = "[Git] Commit", silent = true })
            vim.keymap.set("n", "gl", function() neogit.open({ "log" }) end, { desc = "[Git] Commit", silent = true })
            vim.keymap.set("n", "gP", function() neogit.open({ "push" }) end, { desc = "[Git] Push", silent = true })
            vim.keymap.set("n", "gs", function() neogit.open({ kind = "replace" }) end, { desc = "[Git] Status", silent = true })
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "g,", ":diffget //2<cr>:echo '[GitMerge] Grabbed from left side'<cr>", { desc = "[Git] Diffget from left", silent = true })
            vim.keymap.set("n", "g.", ":diffget //3<cr>:echo '[GitMerge] Grabbed from right side'<cr>", { desc = "[Git] Diffget from right", silent = true })
            vim.keymap.set("n", "gB", ":Git blame<cr>", { desc = "[Git] Blame", silent = true })
            vim.keymap.set("n", "gF", ":Git diff<cr>", { desc = "[Git] Diff", silent = true })
            vim.keymap.set("n", "gL", ":Git log --all --date-order --branches --remotes --tags --graph --decorate<cr>", { desc = "[Git] Log all WITHOUT format", silent = true })
            vim.keymap.set("n", "gm", ":Gvdiffsplit!<cr>", { desc = "[Git] Vertical diff split (retaining focus)", silent = true })
            vim.keymap.set("n", "gv", ":Gvdiffsplit<cr>", { desc = "[Git] Vertical diff split", silent = true })
            vim.keymap.set("n", "gw1", ":Git show HEAD~0<cr>", { desc = "Latest", silent = true })
            vim.keymap.set("n", "gw2", ":Git show HEAD~1<cr>", { desc = "Second latest", silent = true })
            vim.keymap.set("n", "gw3", ":Git show HEAD~2<cr>", { desc = "Third latest", silent = true })
            vim.keymap.set("n", "gw4", ":Git show HEAD~3<cr>", { desc = "Fourth latest", silent = true })
            vim.keymap.set("n", "gw5", ":Git show HEAD~4<cr>", { desc = "Fifth latest", silent = true })
            vim.keymap.set("n", "gww", ":Git show ", { desc = "Enter hash", silent = true })
        end,
    },
}
