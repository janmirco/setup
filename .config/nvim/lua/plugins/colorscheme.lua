return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        vim.opt.termguicolors = true -- colors will be more vivid
        require("catppuccin").setup({ float = { transparent = true } })
        vim.cmd("colorscheme catppuccin-frappe")

        -- toggle light theme
        vim.keymap.set("n", "<A-L>", function()
            if vim.api.nvim_eval("&background") == "dark" then
                vim.opt.background = "light"
                vim.cmd("colorscheme catppuccin-latte")
            else
                vim.opt.background = "dark"
                vim.cmd("colorscheme catppuccin-frappe")
            end
        end, { desc = "Toggle light background", silent = true })
    end,
}
