-- alpha
require("alpha").setup(
    require("alpha.themes.startify").config
)

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup({})


-- coc
require("coc_config")


-- floaterm
vim.g.floaterm_autoinsert = true
vim.g.floaterm_autoclose = 2
vim.g.floaterm_height = 0.8
vim.g.floaterm_width = 0.8
vim.g.floaterm_title = ""


-- gitgutter
vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_highlight_linenrs = 1


-- indentline
vim.g.indentLine_char = "▏"
vim.g.indentLine_enabled = 0


-- julia-vim
vim.g.latex_to_unicode_tab = 0
vim.g.latex_to_unicode_suggestions = 0
vim.g.latex_to_unicode_eager = 0
vim.g.latex_to_unicode_auto = 0
vim.g.latex_to_unicode_keymap = 0
vim.g.julia_blocks = 0


-- leap
require("leap").add_default_mappings()


-- lualine
require("lualine_config")


-- luasnip
require("luasnip_config")


-- markdown-preview
vim.g.mkdp_auto_close = 0
vim.g.mkdp_theme = "light"


-- maximizer
vim.g.maximizer_set_default_mapping = 0


-- mkdnflow
require("mkdnflow_config")


-- nerdcommenter
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = "left"


-- nvim-tree
require("tree_config")


-- nvim-web-devicons
require("nvim-web-devicons").setup()


-- telescope
require("telescope_config")


-- themes
require("themes_config")


-- treesitter
require("treesitter_config")
