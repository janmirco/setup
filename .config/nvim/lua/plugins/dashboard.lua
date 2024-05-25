return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")

        startify.section.top_buttons.val = { startify.button("e", "  New file", "<cmd>enew<cr>") }
        startify.section.bottom_buttons.val = { startify.button("q", "󰅚  Quit", "<cmd>qall<cr>") }

        alpha.setup(startify.config)

        vim.keymap.set("n", "<A-a>", ":Alpha<cr>", { silent = true })
    end,
}
