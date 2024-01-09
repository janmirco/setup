return {
    "ThePrimeagen/harpoon",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require("harpoon").setup({
            global_settings = {
                enter_on_sendcmd = true, -- run command immediately when calling `sendCommand`
            },
        })

        vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { silent = true })

        local harpoon_ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>ht", harpoon_ui.toggle_quick_menu, { silent = true })
        vim.keymap.set("n", "<leader>hn", harpoon_ui.nav_next, { silent = true })
        vim.keymap.set("n", "<leader>hp", harpoon_ui.nav_prev, { silent = true })
        vim.keymap.set("n", "<leader>h1", function() harpoon_ui.nav_file(1) end, { silent = true })
        vim.keymap.set("n", "<leader>h2", function() harpoon_ui.nav_file(2) end, { silent = true })
        vim.keymap.set("n", "<leader>h3", function() harpoon_ui.nav_file(3) end, { silent = true })
        vim.keymap.set("n", "<leader>h4", function() harpoon_ui.nav_file(4) end, { silent = true })
        vim.keymap.set("n", "<leader>h5", function() harpoon_ui.nav_file(5) end, { silent = true })

        vim.keymap.set("n", "<leader>M", function()
            if vim.env.TMUX ~= nil then
                require("harpoon.tmux").sendCommand(1, "make")
            else
                vim.cmd("! make")
            end
        end, { desc = "make (Harpoon)", silent = true })

        vim.keymap.set("n", "<leader>hm", ":Telescope harpoon marks<cr>", { silent = true })
    end,
}
