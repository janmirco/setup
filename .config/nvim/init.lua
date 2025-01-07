--                           _
--    ____  ___  ____ _   __(_)___ ___
--   / __ \/ _ \/ __ \ | / / / __ `__ \    Jan Mirco Pfeifer
--  / / / /  __/ /_/ / |/ / / / / / / /    https://github.com/janmirco
-- /_/ /_/\___/\____/|___/_/_/ /_/ /_/

-- Keyboard repeat recommendation:
--   Delay: 400 ms
--   Rate: 40 repeats/s

vim.g.python3_host_prog = "/bin/python3"
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
}) end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
local opts = { change_detection = { notify = false } }
if vim.env.EDITOR_LIGHT == "yes" then
    lazy.setup({ require("light") }, opts)
else
    lazy.setup("plugins", opts)
end

require("autocmd")
vim.cmd("syntax enable") -- turn on syntax highlighting explicitly after autocmd and before options!
require("options")
require("maps")
