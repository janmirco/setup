-- general color settings
vim.opt.termguicolors = true  -- colors will be more vivid

vim.cmd("colorscheme catppuccin-frappe")  -- dark theme, least contrast

-- floaterm settings
vim.cmd("highlight Floaterm guibg=background")
vim.cmd("highlight FloatermBorder guibg=background guifg=foreground")

-- toggle light theme
local toggle_light = function()
    local dark_on = vim.api.nvim_eval("&background") == "dark"
    if dark_on then
        vim.opt.background = "light"
        vim.cmd("colorscheme catppuccin-latte")  -- light theme
    else
        vim.opt.background = "dark"
        vim.cmd("colorscheme catppuccin-frappe")  -- dark theme, least contrast
    end
    vim.cmd("source " .. vim.env.HOME .. "/.config/nvim/init.lua")
end
vim.keymap.set("n", "<A-l>", toggle_light)
