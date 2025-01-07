-- remap gv (reselection in visual mode) for use with git
vim.keymap.set("n", "gV", "gv", { desc = "Start visual mode with previous area", silent = true })

-- remap macros in order to enable q to quit buffer
vim.keymap.set("n", "Q", "q", { desc = "Record macro", silent = true })

-- set different keymaps for neovim default commenting
--   This function is necessary because otherwise `remap = true` would be
--   necessary for the different keymaps for commenting below. Using
--   `remap = true` would result in not being able to delete corresponding
--   keymaps. And this is necessary if you want to be able to use `<leader>c` in
--   normal mode and `gc` for `git commit`.
local copy_keymap = function(mode, new_lhs, cur_lhs)
    local map_data = vim.fn.maparg(cur_lhs, mode, false, true)
    map_data.lhs, map_data.lhsraw = new_lhs, vim.keycode(new_lhs)
    vim.fn.mapset(map_data)
end
copy_keymap("n", "<leader>c", "gcc") -- use 3<leader>c to comment 3 lines (current line and next two)
copy_keymap("v", "<leader>c", "gc")
vim.keymap.del("n", "gcc")
vim.keymap.del("v", "gc")

-- toggle local spell check
local toggle_spell = function(language)
    local spell_on = vim.api.nvim_eval("&spell") == 1
    local current_lang = vim.api.nvim_eval("&spelllang")

    if spell_on and current_lang == language then
        vim.wo.spell = false
    else
        vim.cmd("setlocal spell spelllang=" .. language)
        vim.wo.spell = true
    end
end
vim.keymap.set("n", "<A-e>", function() toggle_spell("en_us") end, { desc = "Toggle spell en_us", silent = true })
vim.keymap.set("n", "<A-d>", function() toggle_spell("de") end, { desc = "Toggle spell de", silent = true })

-- more spell keymaps
local jump_to_spell_error = function(direction)
    local spell_off = vim.api.nvim_eval("&spell") ~= 1
    if spell_off then
        vim.cmd("setlocal spell spelllang=en_us")
        vim.wo.spell = true
    end
    local keys = vim.api.nvim_replace_termcodes(direction .. "szz", true, false, true)
    vim.api.nvim_feedkeys(keys, "n", true)
end
vim.keymap.set("n", "]s", function() jump_to_spell_error("]") end, { desc = "[Spell] Next error", silent = true })
vim.keymap.set("n", "[s", function() jump_to_spell_error("[") end, { desc = "[Spell] Previous error", silent = true })
-- z= --> opens dictionary and lets you choose the right word
-- zg --> add word do dictionary

-- toggle winbar
local toggle_winbar = function()
    local winbar_off = vim.api.nvim_eval("&winbar") == ""
    if winbar_off then
        vim.opt.winbar = "%=%m %F"
    else
        vim.opt.winbar = nil
    end
end
vim.keymap.set("n", "<A-W>", toggle_winbar, { desc = "Toggle winbar", silent = true })

-- toggle tabline
local toggle_tabline = function()
    local tabline_off = vim.api.nvim_eval("&showtabline") == 0
    if tabline_off then
        vim.opt.showtabline = 2
    else
        vim.opt.showtabline = 0
    end
end
vim.keymap.set("n", "<A-b>", toggle_tabline, { desc = "Toggle tabline", silent = true })

-- toggle any option
local toggle = function(option) vim.opt[option] = not (vim.api.nvim_eval("&" .. option) == 1) end
vim.keymap.set("n", "<A-w>", function() toggle("wrap") end, { desc = "Toggle wrap", silent = true })
vim.keymap.set("n", "<A-R>", function() toggle("relativenumber") end, { desc = "Toggle relativenumber", silent = true })

-- standard commands mapped with leader
vim.keymap.set("n", "<leader>R", function()
    vim.cmd("edit")
    print(vim.fn.expand("%:t") .. " reloaded")
end, { desc = "Reload current file", silent = true })
vim.keymap.set("n", "<leader>w", function()
    vim.cmd("write")
    print(vim.fn.expand("%:t") .. " written")
end, { desc = "write", silent = true })
vim.keymap.set("n", "<leader>W", function()
    vim.cmd("wall")
    print("All files written")
end, { desc = "wall", silent = true })
vim.keymap.set("n", "<leader>q", function() vim.cmd("quit") end, { desc = "quit", silent = true })
vim.keymap.set("n", "<leader>Q", function() vim.cmd("qall") end, { desc = "qall", silent = true })
vim.keymap.set("n", "<leader>a", function()
    vim.cmd("wall")
    vim.cmd("qall")
end, { desc = "wall; qall", silent = true })
vim.keymap.set("n", "<leader>e", ":edit ", { desc = "edit", silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit ", { desc = "vsplit", silent = true })
vim.keymap.set("n", "<leader>s", ":split ", { desc = "split", silent = true })

-- buffers
vim.keymap.set("n", "q", function()
    local buffer_count = #vim.fn.getbufinfo({ buflisted = 1 })
    if buffer_count > 1 then
        vim.cmd("bdelete")
    else
        vim.cmd("quit")
    end
end, { desc = "Delete current buffer", silent = true })
vim.keymap.set("n", "<Tab>", function() vim.cmd("bnext") end, { silent = true })
vim.keymap.set("n", "<BS>", function() vim.cmd("bprevious") end, { silent = true })
vim.keymap.set("n", "<leader>rb", ":bufdo %s///ge | update", { desc = "Buffer-wide search/replace", silent = true })

-- close every window except for the current one
vim.keymap.set("n", "<leader>ow", function()
    vim.cmd("update")
    vim.cmd("only")
    print("Closed all except current window: " .. vim.fn.expand("%:t"))
end, { desc = "Close all except current window", silent = true })

-- source current file
vim.keymap.set("n", "<leader>5", function() vim.cmd("source %") end, { desc = "Source current file", silent = true })

-- execute lua code
vim.keymap.set("n", "<leader>x", ":luafile %<cr>", { desc = "Execute current file", silent = true })
vim.keymap.set("n", "<leader>X", ":.lua<cr>", { desc = "Execute current line", silent = true })

-- print and change working directory
vim.keymap.set("n", "<leader>pp", function() vim.cmd("pwd") end, { desc = "Print", silent = true })
vim.keymap.set("n", "<leader>pg", function() vim.cmd("cd %:h") end, { desc = "Change to current buffer (global)", silent = true })
vim.keymap.set("n", "<leader>pl", function() vim.cmd("lcd %:h") end, { desc = "Change to current buffer (local)", silent = true })

-- show files of current directory and directory tree
vim.keymap.set("n", "<leader>l", function() vim.cmd("! ls -l --almost-all --human-readable --group-directories-first") end, { desc = "ls", silent = true })
vim.keymap.set("n", "<leader>t", function() vim.cmd("! tree -avn --dirsfirst -I '.git|node_modules|env'") end, { desc = "tree", silent = true })

-- remove trailing whitespace and only save if there was any
vim.keymap.set("n", "<leader>rw", function()
    vim.cmd("windo %s/\\s\\+$//ge")
    vim.cmd("windo update")
end, { desc = "Remove trailing whitespace of all windows", silent = true })

-- search word where cursor hovers over
vim.keymap.set("n", "<leader>n", "*", { desc = "Forward  search word under cursor", silent = true })
vim.keymap.set("n", "<leader>N", "#", { desc = "Backward search word under cursor", silent = true })

-- window commands
vim.keymap.set("n", "<C-h>", function() vim.cmd("wincmd h") end, { desc = "Move one window left", silent = true })
vim.keymap.set("n", "<C-j>", function() vim.cmd("wincmd j") end, { desc = "Move one window down", silent = true })
vim.keymap.set("n", "<C-k>", function() vim.cmd("wincmd k") end, { desc = "Move one window up", silent = true })
vim.keymap.set("n", "<C-l>", function() vim.cmd("wincmd l") end, { desc = "Move one window right", silent = true })
vim.keymap.set("n", "<C-up>", function() vim.cmd("resize +2") end, { desc = "Resize window up", silent = true })
vim.keymap.set("n", "<C-down>", function() vim.cmd("resize -2") end, { desc = "Resize window down", silent = true })
vim.keymap.set("n", "<C-right>", function() vim.cmd("vertical resize +2") end, { desc = "Resize window right", silent = true })
vim.keymap.set("n", "<C-left>", function() vim.cmd("vertical resize -2") end, { desc = "Resize window left", silent = true })
vim.keymap.set("n", "<leader>=", function() vim.cmd("wincmd =") end, { desc = "Equalize all window sizes", silent = true })

-- open neovim init.lua
vim.keymap.set("n", "<A-n>", function()
    vim.cmd("update")
    vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
end, { desc = "Open init.lua", silent = true })

-- jump back to first opened file (Buffer 1)
vim.keymap.set("n", "<A-o>", function()
    vim.cmd("update")
    vim.cmd("buffer 1")
end, { desc = "Jump back to first opened buffer", silent = true })

-- scrolling
vim.keymap.set("n", "<s-up>", "<c-e>", { desc = "Scroll current line down without moving cursor", silent = true })
vim.keymap.set("n", "<s-down>", "<c-y>", { desc = "Scroll current line up without moving cursor", silent = true })

-- yank
vim.keymap.set("n", "Y", "y$", { silent = true }) -- to the end of the line
vim.keymap.set("n", "<C-y>", ":%y+<cr>", { desc = "Yank entire file", silent = true })

-- keeping it centered
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "J", "maJ`a:delmarks a<cr>", { silent = true })

-- move current line
vim.keymap.set("n", "<A-j>", "<S-v>dp", { desc = "Move current line down", silent = true })
vim.keymap.set("n", "<A-k>", "<S-v>dkP", { desc = "Move current line up", silent = true })

-- open help menu for word under cursor
vim.keymap.set("n", "H", "yiw:help <C-r>\"<cr>")

-- access text from registers
vim.keymap.set("n", "<leader>1", "\"1p", { desc = "Access text from register 1", silent = true })
vim.keymap.set("n", "<leader>2", "\"2p", { desc = "Access text from register 2", silent = true })
vim.keymap.set("n", "<leader>3", "\"3p", { desc = "Access text from register 3", silent = true })
vim.keymap.set("n", "<leader>4", "\"4p", { desc = "Access text from register 4", silent = true })

-- updating
vim.keymap.set("n", "<leader>u1", function() require("lazy").update({ wait = true }) end, { desc = "Lazy", silent = true })
vim.keymap.set("n", "<leader>u2", function() vim.cmd("TSUpdate") end, { desc = "Treesitter", silent = true })
vim.keymap.set("n", "<leader>u3", function() vim.cmd("MasonUpdate") end, { desc = "Mason registries", silent = true })
vim.keymap.set("n", "<leader>u4", function() vim.cmd("Mason") end, { desc = "Mason", silent = true })

-- make
vim.keymap.set("n", "<leader>m", function() vim.cmd("! make") end, { desc = "make", silent = true })

-- manual indenting
vim.keymap.set("n", "<leader><leader>", function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("normal! gg=G")
    vim.api.nvim_win_set_cursor(0, cursor_pos)
    vim.cmd("normal! ^zz")
end, { desc = "Indent current file using neovim", silent = true })

-- sort entire file
vim.keymap.set("n", "<leader>S", function() vim.cmd("sort i") end, { desc = "Sort entire file", silent = true })
