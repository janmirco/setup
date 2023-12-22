require("noice").setup({
    messages = { enabled = false },
    notify = { enabled = false },
})

vim.keymap.set("n", "fm", ":NoiceTelescope<cr>", {silent = true})
