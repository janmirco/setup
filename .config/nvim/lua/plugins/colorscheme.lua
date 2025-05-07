return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        vim.opt.termguicolors = true -- colors will be more vivid
        vim.cmd("colorscheme catppuccin-frappe")

        -- floaterm settings
        vim.cmd("highlight Floaterm guibg=background")
        vim.cmd("highlight FloatermBorder guibg=background guifg=foreground")

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
