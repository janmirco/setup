-- c/c++
local cpp_group = vim.api.nvim_create_augroup("CppAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = cpp_group,
    pattern = { "*.cpp", "*.hpp", "*.c", "*.h" },
    callback = function() vim.cmd(":silent exec '! clang-format -i --style=file:$HOME/.config/nvim/.clang-format %'") end,
})

-- lua
local lua_group = vim.api.nvim_create_augroup("LuaAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = lua_group,
    pattern = "*.lua",
    callback = function() vim.cmd(":silent exec '! stylua --call-parentheses Always --collapse-simple-statement Always --column-width 1000 --indent-type Spaces --indent-width 4 --line-endings Unix --quote-style ForceDouble %'") end,
})

-- matlab/octave
local matlab_group = vim.api.nvim_create_augroup("MatlabAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = matlab_group,
    pattern = "*.m",
    callback = function()
        -- vim.keymap.set("n", "gd", "yiw:vimgrep function.*<C-r>\" ./.**/*.m<cr>/<C-r>\"<cr>", { desc = "[LSP] Go to definition", silent = true })
        vim.keymap.set("n", "gd", ":! ctags -R .<cr><cr><C-]>:! rm -f tags<cr><cr>", { desc = "[LSP] Go to definition", silent = true })
    end,
})

-- python
local py_group = vim.api.nvim_create_augroup("PythonAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = py_group,
    pattern = "*.py",
    callback = function()
        vim.cmd(":silent exec '! python3 -m isort --profile=black --line-length=1000 %'")
        vim.cmd(":silent exec '! python3 -m black --line-length=1000 %'")
    end,
})
