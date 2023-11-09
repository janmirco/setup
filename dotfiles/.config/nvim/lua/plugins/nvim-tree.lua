vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local my_on_attach = function (bufnr)
    local api = require("nvim-tree.api")

    local opts = function (desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- open file or directory
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))

    -- close directory
    vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
end

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    filters = {
    },
    git = {
        enable = true,
        ignore = false,
    },
    on_attach = my_on_attach,
})

vim.keymap.set("n", "<A-t>", ":NvimTreeFindFileToggle<cr>zz", {silent = true})
