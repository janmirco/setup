return {
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "1.*",
        config = function()
            require("typst-preview").setup({
                open_cmd = "chromium %s",
            })
            vim.keymap.set("n", "<A-p>", "<cmd>TypstPreview<cr>", { silent = true })
        end,
    },
}
