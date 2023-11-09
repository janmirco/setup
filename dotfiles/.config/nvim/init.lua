-- =============================================================================
--      _   _                 _              _____             __ _
--     | \ | |               (_)            / ____|           / _(_)
--     |  \| | ___  _____   ___ _ __ ___   | |     ___  _ __ | |_ _  __ _
--     | . ` |/ _ \/ _ \ \ / / | '_ ` _ \  | |    / _ \| '_ \|  _| |/ _` |
--     | |\  |  __/ (_) \ V /| | | | | | | | |___| (_) | | | | | | | (_| |
--     |_| \_|\___|\___/ \_/ |_|_| |_| |_|  \_____\___/|_| |_|_| |_|\__, |
--                                                                   __/ |
--                                                                  |___/
-- =============================================================================

-- -----------------------------------------------
-- Keyboard repeat

-- Default on Debian 10:
--   Delay: 600 ms
--   Rate: 25 repeats/s

-- Recommendation:
--   Delay: 400 ms
--   Rate: 40 repeats/s


vim.cmd("call plug#begin('$HOME/.config/nvim/autoload/plugged')")
vim.cmd("Plug 'JuliaEditorSupport/julia-vim'")
vim.cmd("Plug 'L3MON4D3/LuaSnip'")
vim.cmd("Plug 'Yggdroot/indentLine'")
vim.cmd("Plug 'airblade/vim-gitgutter'")
vim.cmd("Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }")
vim.cmd("Plug 'christoomey/vim-tmux-navigator'")
vim.cmd("Plug 'czheo/mojo.vim'")
vim.cmd("Plug 'dracula/vim', { 'as': 'dracula' }")
vim.cmd("Plug 'fannheyward/telescope-coc.nvim'")
vim.cmd("Plug 'folke/zen-mode.nvim'")
vim.cmd("Plug 'ggandor/leap.nvim'")
vim.cmd("Plug 'goolord/alpha-nvim'")
vim.cmd("Plug 'hrsh7th/nvim-cmp'")
vim.cmd("Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }")
vim.cmd("Plug 'jakewvincent/mkdnflow.nvim'")
vim.cmd("Plug 'justinmk/vim-syntax-extra'")
vim.cmd("Plug 'morhetz/gruvbox'")
vim.cmd("Plug 'neoclide/coc.nvim', {'branch': 'release'}")
vim.cmd("Plug 'nvim-lua/plenary.nvim'")
vim.cmd("Plug 'nvim-lualine/lualine.nvim'")
vim.cmd("Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}")
vim.cmd("Plug 'nvim-telescope/telescope-fzf-writer.nvim'")
vim.cmd("Plug 'nvim-telescope/telescope.nvim'")
vim.cmd("Plug 'nvim-tree/nvim-tree.lua'")
vim.cmd("Plug 'nvim-tree/nvim-web-devicons'")
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}")
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter-context'")
vim.cmd("Plug 'nvim-treesitter/playground'")
vim.cmd("Plug 'preservim/nerdcommenter'")
vim.cmd("Plug 'puremourning/vimspector'")
vim.cmd("Plug 'sainnhe/everforest'")
vim.cmd("Plug 'sainnhe/gruvbox-material'")
vim.cmd("Plug 'stevearc/oil.nvim'")
vim.cmd("Plug 'szw/vim-maximizer'")
vim.cmd("Plug 'tpope/vim-fugitive'")
vim.cmd("Plug 'vim-scripts/MatlabFilesEdition'")
vim.cmd("Plug 'vim-scripts/matchit.zip'")
vim.cmd("Plug 'voldikss/vim-floaterm'")
vim.cmd("call plug#end()")


vim.g.python3_host_prog = "/bin/python3"
vim.g.mapleader = " "


require("plugins")
require("syntax")  -- this needs to be BEFORE `syntax enable` command
require("general_options")
require("maps")
require("format")
require("rulers")
