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



-- =============================================================================
--   Sec: Plugins
-- =============================================================================

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
vim.cmd("Plug 'szw/vim-maximizer'")
vim.cmd("Plug 'tpope/vim-fugitive'")
vim.cmd("Plug 'vim-scripts/MatlabFilesEdition'")
vim.cmd("Plug 'vim-scripts/matchit.zip'")
vim.cmd("Plug 'voldikss/vim-floaterm'")
vim.cmd("call plug#end()")


-- plugin-specific configurations
require("index_configs")



-- =============================================================================
--   Sec: Syntax (this needs to be BEFORE syntax enable)
-- =============================================================================

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



-- =============================================================================
--   Sec: General options
-- =============================================================================

require("general_options")
vim.cmd("let g:python3_host_prog = '/bin/python3'")



-- =============================================================================
--   Sec: Rulers
-- =============================================================================

-- vertical ruler
vim.cmd("autocmd BufEnter *                set colorcolumn=81")
vim.cmd("autocmd BufEnter *.tex,*.md,*.txt set colorcolumn=81,161")
vim.cmd("autocmd BufEnter CMake*           set colorcolumn=81")
vim.cmd("autocmd BufEnter *.f,*.f77,*.for  set colorcolumn=6,73")
vim.cmd("autocmd BufEnter COMMIT_EDITMSG   set colorcolumn=51,73")


-- horizontal ruler
vim.cmd("set cursorline")



-- =============================================================================
--   Sec: Keymaps
-- =============================================================================

vim.cmd("let g:mapleader=' '")
require("index_maps")
require("auto/format")
