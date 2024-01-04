return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
        require("noice").setup({
            messages = { enabled = false },
            notify = { enabled = false },
        })
        vim.keymap.set("n", "fm", ":NoiceTelescope<cr>", { silent = true })
    end,
}
