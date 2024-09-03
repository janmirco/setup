return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")

        startify.section.top_buttons.val = { startify.button("e", "  New file", "<cmd>enew<cr>") }
        startify.section.bottom_buttons.val = { startify.button("q", "󰅚  Quit", "<cmd>qall<cr>") }

        startify.section.mru_cwd.val = function()
            return {
                { type = "padding", val = 1 },
                {
                    type = "text",
                    val = "MRU " .. vim.fn.getcwd(),
                    opts = {
                        hl = "SpecialComment",
                        shrink_margin = false,
                    },
                },
                { type = "padding", val = 1 },
                startify.mru(1, vim.fn.getcwd(), 9),
            }
        end

        startify.section.mru.val = function()
            return {
                { type = "padding", val = 1 },
                {
                    type = "text",
                    val = "MRU",
                    opts = {
                        hl = "SpecialComment",
                        shrink_margin = false,
                    },
                },
                { type = "padding", val = 1 },
                startify.mru(11, nil, 9),
            }
        end

        alpha.setup(startify.config)

        vim.keymap.set("n", "<A-a>", ":Alpha<cr>", { silent = true })
    end,
}
