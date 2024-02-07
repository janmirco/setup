return {
    "JuliaEditorSupport/julia-vim",
    config = function()
        vim.g.latex_to_unicode_tab = 0
        vim.g.latex_to_unicode_suggestions = 0
        vim.g.latex_to_unicode_eager = 0
        vim.g.latex_to_unicode_auto = 0
        vim.g.latex_to_unicode_keymap = 0
        vim.g.julia_blocks = 0
    end,
}
