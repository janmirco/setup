vim.opt.termguicolors = true

-- https://github.com/akinsho/bufferline.nvim/issues/9
vim.cmd("autocmd BufAdd,VimEnter * if len(getbufinfo({'buflisted':1})) > 1 | set showtabline=2 | endif")
vim.cmd("autocmd BufDelete * if len(getbufinfo({'buflisted':1})) -1 < 2 | set showtabline=1 | endif")
require("bufferline").setup({})
