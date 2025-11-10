return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_theme = "light"
            vim.g.mkdp_browser = "chromium"
            vim.keymap.set("n", "<A-p>", "<Plug>MarkdownPreview", { silent = true })
        end,
    },
}
