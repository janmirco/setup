vim.g.python3_host_prog = "/bin/python3"
vim.g.mapleader = " "
vim.g.markdown_folding = 1

vim.cmd("syntax enable") -- turn on syntax highlighting explicitly before options!

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

vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.smoothscroll = true
vim.opt.scrolloff = 0
vim.opt.sidescroll = 1
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

vim.opt.showtabline = 2 -- You do not want tabs! Trust me. -- I know. I'm bad. But please let me try it out for a few weeks.
vim.opt.tabpagemax = 100

vim.opt.autoread = true
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.path = { ".", "/usr/include", "", "**" }

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3
vim.opt.winbar = ""
vim.opt.winborder = "" -- This will mess with certain plugins with pop-up windows, for example, Lazy and Mason.
vim.opt.conceallevel = 2
vim.opt.guicursor = table.concat({
    "n-v-sm:block",
    "i-c-ci-ve-t:ver25",
    "r-cr-o:hor20",
}, ",")

vim.opt.colorcolumn = { 81, 161 }
vim.opt.cursorline = true
