-- vertical ruler
vim.cmd("autocmd BufEnter *                set colorcolumn=81")
vim.cmd("autocmd BufEnter *.tex,*.md,*.txt set colorcolumn=81,161")
vim.cmd("autocmd BufEnter CMake*           set colorcolumn=81")
vim.cmd("autocmd BufEnter *.f,*.f77,*.for  set colorcolumn=6,73")
vim.cmd("autocmd BufEnter COMMIT_EDITMSG   set colorcolumn=51,73")

-- Remove colorcolumn after reentering dashboard, e.g., after using CTRL+C when using Telescope from dashboard
vim.cmd("autocmd BufEnter * if &filetype=='dashboard' | set colorcolumn= | endif") -- see plugins/dashboard.lua

-- horizontal ruler
vim.cmd("set cursorline")
