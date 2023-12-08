-- general color settings
vim.opt.termguicolors = true  -- colors will be more vivid


-- theme-specific settings
-- local my_theme = "gruvbox"
-- local my_theme = "gruvbox-material"
-- local my_theme = "everforest"
-- local my_theme = "dracula"
-- local my_theme = "tokyo"
-- local my_theme = "kanagawa"
-- local my_theme = "nightfox"
local my_theme = "catppuccin"

if my_theme == "gruvbox" then
    vim.g.gruvbox_contrast_dark = "hard"
    vim.cmd("colorscheme gruvbox")

elseif my_theme == "gruvbox-material" then
    vim.g.gruvbox_material_palette = "material"
    -- vim.g.gruvbox_material_palette = "mix"
    -- vim.g.gruvbox_material_palette = "original"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_disable_italic_comment = 1
    vim.cmd("colorscheme gruvbox-material")

elseif my_theme == "everforest" then
    vim.g.everforest_background = "hard"
    vim.g.everforest_better_performance = 1
    vim.g.everforest_disable_italic_comment = 1
    vim.cmd("colorscheme everforest")

elseif my_theme == "dracula" then
    vim.cmd("colorscheme dracula")

elseif my_theme == "tokyo" then
    vim.cmd("colorscheme tokyonight-storm")
    -- vim.cmd("colorscheme tokyonight-moon")  -- more contrast
    -- vim.cmd("colorscheme tokyonight-night")  -- even more contrast

elseif my_theme == "kanagawa" then
    vim.cmd("colorscheme kanagawa-wave")  -- blue (default)
    -- vim.cmd("colorscheme kanagawa-dragon")  -- black

elseif my_theme == "nightfox" then
    vim.cmd("colorscheme nightfox")  -- turquoise (default)
    -- vim.cmd("colorscheme duskfox")  -- purple
    -- vim.cmd("colorscheme nordfox")  -- gray
    -- vim.cmd("colorscheme terafox")  -- green
    -- vim.cmd("colorscheme carbonfox")  -- black

elseif my_theme == "catppuccin" then
    -- vim.cmd("colorscheme catppuccin-mocha")  -- high contrast
    -- vim.cmd("colorscheme catppuccin-macchiato")  -- less contrast
    vim.cmd("colorscheme catppuccin-frappe")  -- least contrast
    -- vim.cmd("colorscheme catppuccin-latte")  -- light theme

end


-- floaterm settings
vim.cmd("highlight Floaterm guibg=background")
vim.cmd("highlight FloatermBorder guibg=background guifg=foreground")
