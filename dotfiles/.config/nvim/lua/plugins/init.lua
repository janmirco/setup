local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",  -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "EdenEast/nightfox.nvim", priority = 1000, },
    { "JuliaEditorSupport/julia-vim" },
    { "L3MON4D3/LuaSnip" },
    { "ThePrimeagen/harpoon", dependencies = "nvim-lua/plenary.nvim", },
    { "Yggdroot/indentLine" },
    { "airblade/vim-gitgutter" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, },
    { "christoomey/vim-tmux-navigator" },
    { "czheo/mojo.vim" },
    { "dracula/vim", name = "dracula", priority = 1000, },
    { "fannheyward/telescope-coc.nvim" },
    { "folke/noice.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", }, },
    { "folke/tokyonight.nvim", priority = 1000, },
    { "folke/zen-mode.nvim" },
    { "ggandor/leap.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "iamcco/markdown-preview.nvim", cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop", }, build = "cd app && yarn install", init = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, },
    { "jakewvincent/mkdnflow.nvim" },
    { "justinmk/vim-syntax-extra" },
    { "morhetz/gruvbox", priority = 1000, },
    { "neoclide/coc.nvim", branch = "release", },
    { "nvim-lua/plenary.nvim" },
    { "nvim-lualine/lualine.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", },
    { "nvim-telescope/telescope-fzf-writer.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate", },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "nvim-treesitter/playground" },
    { "nvimdev/dashboard-nvim", event = "VimEnter", dependencies = "nvim-tree/nvim-web-devicons", },
    { "preservim/nerdcommenter" },
    { "puremourning/vimspector" },
    { "rebelot/kanagawa.nvim", priority = 1000, },
    { "sainnhe/everforest", priority = 1000, },
    { "sainnhe/gruvbox-material", priority = 1000, },
    { "stevearc/oil.nvim" },
    { "szw/vim-maximizer" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-repeat" },
    { "tpope/vim-speeddating" },
    { "tpope/vim-surround" },
    { "vim-scripts/MatlabFilesEdition" },
    { "vim-scripts/matchit.zip" },
    { "voldikss/vim-floaterm" },
}

local opts = {}

require("lazy").setup(plugins, opts)

-- configurations
require("plugins/coc")
require("plugins/dashboard")
require("plugins/floaterm")
require("plugins/fugitive")
require("plugins/gitgutter")
require("plugins/harpoon")
require("plugins/indentline")
require("plugins/julia-vim")
require("plugins/leap")
require("plugins/lualine")
require("plugins/luasnip")
require("plugins/markdown-preview")
require("plugins/maximizer")
require("plugins/mkdnflow")
require("plugins/mls")
require("plugins/nerdcommenter")
require("plugins/noice")
require("plugins/nvim-tree")
require("plugins/nvim-web-devicons")
require("plugins/oil")
require("plugins/telescope")
require("plugins/themes")
require("plugins/treesitter")
require("plugins/vim-tmux-navigator")
require("plugins/vimspector")
require("plugins/zen_mode")
