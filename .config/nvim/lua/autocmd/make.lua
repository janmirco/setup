vim.filetype.add({
    extension = {
        makefile = "make",
        Makefile = "make",
        MAKEFILE = "make",
    },
})

local make_group = vim.api.nvim_create_augroup("MakefileAugroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = make_group,
    pattern = "make",
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})
