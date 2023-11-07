vim.cmd("autocmd BufEnter * nmap <silent> <Leader><Leader> magg=G`a:delmarks a<CR>:echo '[VimFormat] Formatted file'<CR>")
vim.cmd("autocmd BufEnter *.go nmap <silent> <Leader><Leader> :update<CR>:! go fmt %<CR><CR>:e %<CR>:echo '[GoFormat] Formatted Go file with go fmt'<CR>")
vim.cmd("autocmd BufEnter *.py nmap <silent> <Leader><Leader> :update<CR>:! python3 -m isort --profile=black --line-length=1000 %<CR><CR>:e %<CR>:! python3 -m black --line-length=1000 %<CR><CR>:e %<CR>:echo '[PyFormat] Formatted Python file with isort & Black'<CR>")
vim.cmd("autocmd BufEnter *.rs nmap <silent> <Leader><Leader> :update<cr>:! rustfmt %<cr><cr>:e %<cr>:echo '[RustFormat] Formatted Rust file with rustfmt'<CR>")
vim.cmd("autocmd BufEnter *.tex nmap <silent> <Leader><Leader> magg=G=G`a:delmarks a<CR>:echo '[VimFormat] Formatted TeX file'<CR>")
vim.cmd("autocmd BufEnter *.cpp,*.hpp,*.c,*.h nmap <silent> <Leader><Leader> :update<cr>:! clang-format -i --style=file:$HOME/.config/nvim/lua/auto/.clang-format %<cr><cr>:e %<cr>:echo '[CppFormat] Formatted C/C++ file with clang-format'<cr>")

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PythonAugroup", {clear = true}),
    pattern = "*.py",
    callback = function()
        vim.cmd(":silent exec '! python3 -m isort --profile=black --line-length=1000 %'")
        vim.cmd(":silent exec '! python3 -m black --line-length=1000 %'")
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("CppAugroup", {clear = true}),
    pattern = {"*.cpp", "*.hpp", "*.c", "*.h"},
    callback = function()
        vim.cmd(":silent exec '! clang-format -i --style=file:$HOME/.config/nvim/lua/auto/.clang-format %'")
    end,
})
