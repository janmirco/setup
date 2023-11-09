require("alpha").setup(
    require("alpha.themes.startify").config
)

vim.keymap.set("n", "<A-a>", ":Alpha<cr>", {silent = true})
