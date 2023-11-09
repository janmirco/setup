local augroup = vim.api.nvim_create_augroup("MatlabLanguageServer", {clear = true})

-- local mls_command = "nmap gd yiw:vimgrep function.*<C-r>\" ./.**/*.m<cr>/<C-r>\"<cr>"
local mls_command = "nmap <silent> gd :! ctags -R .<cr><cr><C-]>:! rm -f tags<cr><cr>"

vim.api.nvim_create_autocmd(
    {"BufEnter"}, {command = mls_command, group = augroup, pattern = "*.m"}
)
