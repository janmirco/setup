return {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("trouble").setup({
            action_keys = {
                jump = { "o", "<tab>", "<2-leftmouse>" },
                jump_close = { "<cr>" },
            },
        })
        vim.keymap.set("n", "trr", ":TroubleRefresh<cr>", { desc = "Refresh", silent = true })
        vim.keymap.set("n", "trt", ":TroubleToggle<cr>", { desc = "Toggle", silent = true })
    end,
}
