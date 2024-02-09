local set_fortran_globals = function()
    vim.g.fortran_do_enddo = 1
    vim.g.fortran_fold = 1
    vim.g.fortran_fold_conditionals = 1
    vim.g.fortran_fold_multilinecomments = 1
    -- vim.g.fortran_more_precise = 1 -- SLOW!
end

local fortran_free_group = vim.api.nvim_create_augroup("FortranFreeAugroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
    group = fortran_free_group,
    pattern = { "*.f90", "Irun*", "feap*.jinja" },
    callback = function()
        vim.cmd("setfiletype fortran")
        vim.g.fortran_free_source = 1
        set_fortran_globals()
    end,
})

local fortran_fixed_group = vim.api.nvim_create_augroup("FortranFixedAugroup", { clear = true })
vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
    group = fortran_fixed_group,
    pattern = { "*.f", "*.f77", "*.for" },
    callback = function()
        vim.opt.colorcolumn = { 6, 73 }
        vim.cmd("setlocal spell spelllang=en_us")
        vim.g.fortran_fixed_source = 1
        set_fortran_globals()
    end,
})
