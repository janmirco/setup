-- bash
vim.cmd("autocmd BufEnter,BufRead .bash* setfiletype bash")


-- fortran
vim.cmd("autocmd BufEnter,BufRead Irun* setfiletype fortran")
vim.cmd("autocmd BufEnter,BufRead feap*.jinja setfiletype fortran")
vim.cmd("autocmd BufEnter *.f let g:fortran_fixed_source = 1")
vim.cmd("autocmd BufEnter *.f90,Irun* let g:fortran_free_source = 1")
vim.cmd("autocmd BufEnter *.f,*.f90,Irun* let g:fortran_do_enddo = 1")
vim.cmd("autocmd BufEnter *.f,*.f90,Irun* let g:fortran_fold = 1")
vim.cmd("autocmd BufEnter *.f,*.f90,Irun* let g:fortran_fold_conditionals = 1")
vim.cmd("autocmd BufEnter *.f,*.f90,Irun* let g:fortran_fold_multilinecomments = 1")
-- vim.cmd("autocmd BufEnter *.f,*.f90,Irun* let g:fortran_more_precise = 1")  -- SLOW!


-- git commit message
vim.cmd("autocmd BufEnter,BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us")


-- latex
vim.cmd("autocmd BufEnter,BufRead *.tex setfiletype tex")
vim.cmd("autocmd BufEnter,BufRead *.tex let g:tex_flavor = 'latex'")
vim.cmd("autocmd BufEnter,BufRead *.tex let g:tex_nospell = 0")
vim.cmd("autocmd BufEnter,BufRead *.tex let g:tex_comment_nospell = 0")
vim.cmd("autocmd BufEnter,BufRead *.tex let g:tex_verbspell = 1")
vim.cmd("autocmd BufEnter,BufRead *.tex syntax spell toplevel")


-- markdown
vim.cmd("autocmd BufEnter,BufRead *.md setfiletype markdown")


-- matlab
vim.cmd("autocmd BufEnter,BufRead *.m setfiletype matlab")
vim.cmd("autocmd BufEnter *.m set commentstring=%%s")


-- mathematica
vim.cmd("autocmd BufEnter,BufRead *.ma,*.mm,*.mma setfiletype mma")
