-- general color settings
vim.opt.termguicolors = true  -- colors will be more vivid


-- theme-specific settings
-- local my_theme = "gruvbox"
local my_theme = "gruvbox-material"
-- local my_theme = "everforest"
-- local my_theme = "dracula"

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

end


-- floaterm settings
vim.cmd("highlight Floaterm guibg=background")
vim.cmd("highlight FloatermBorder guibg=background guifg=foreground")
