vim.opt.errorbells = false

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.backspace = { "indent", "eol", "start" }

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.foldmethod = "manual"
vim.cmd("autocmd FileType * set formatoptions-=cro")

vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.smoothscroll = true
vim.opt.scrolloff = 0
vim.opt.sidescroll = 0
vim.opt.sidescrolloff = 0
vim.opt.scrollbind = false

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50
vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.showtabline = 0 -- You do not want tabs! Trust me.
vim.opt.tabpagemax = 100

vim.opt.autoread = true
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.path = { ".", "/usr/include", "", "**" }

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.opt.winbar = nil
vim.opt.conceallevel = 2
