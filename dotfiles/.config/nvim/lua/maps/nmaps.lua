-- remap gv (reselection in visual mode) for use with git
vim.keymap.set("n", "gV", "gv", { desc = "Start visual mode with previous area", silent = true })

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

-- some keymaps for spell checking:
-- ]s --> moves forward  through the mistakes
-- [s --> moves backward through the mistakes
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

-- toggle any option
local toggle = function(option) vim.opt[option] = not (vim.api.nvim_eval("&" .. option) == 1) end
vim.keymap.set("n", "<A-w>", function() toggle("wrap") end, { desc = "Toggle wrap", silent = true })
vim.keymap.set("n", "<A-R>", function() toggle("relativenumber") end, { desc = "Toggle relativenumber", silent = true })

-- standard commands mapped with leader
vim.keymap.set("n", "<leader>R", function()
    vim.cmd("edit")
    print(vim.fn.expand("%:t") .. " reloaded")
end, { desc = "reload current file", silent = true })
vim.keymap.set("n", "<leader>w", function()
    vim.cmd("write")
    print(vim.fn.expand("%:t") .. " written")
end, { desc = "write", silent = true })
vim.keymap.set("n", "<leader>W", function()
    vim.cmd("wall")
    print("All files written")
end, { desc = "wall", silent = true })
vim.keymap.set("n", "<leader>Q", function() vim.cmd("qall") end, { desc = "qall", silent = true })
vim.keymap.set("n", "<leader>a", function()
    vim.cmd("wall")
    vim.cmd("qall")
end, { desc = "wall; qall", silent = true })
vim.keymap.set("n", "<leader>cq", function() vim.cmd("cquit") end, { desc = "cquit", silent = true })
vim.keymap.set("n", "<leader>e", ":edit ", { desc = "edit", silent = true })
vim.keymap.set("n", "<leader>v", ":vsplit ", { desc = "vsplit", silent = true })
vim.keymap.set("n", "<leader>s", ":split ", { desc = "split", silent = true })

-- buffers
vim.keymap.set("n", "<leader>q", ":bdelete<cr>", { desc = "Unload current buffer and delete it from the buffer list", silent = true })
vim.keymap.set("n", "<Tab>", ":bnext<cr>", { silent = true })
vim.keymap.set("n", "<BS>", ":bprevious<cr>", { silent = true })
vim.keymap.set("n", "<A-b>", "<C-o>", { silent = true })
vim.keymap.set("n", "<A-f>", "<C-i>", { silent = true })

-- close every window except for the current one
vim.keymap.set("n", "<leader>ow", function()
    vim.cmd("update")
    vim.cmd("only")
    print("Closed all windows except: " .. vim.fn.expand("%:t"))
end, { desc = "Close all except current window", silent = true })

-- source init.lua
vim.keymap.set("n", "<leader>5", ":source %<cr>", { desc = "Source current buffer", silent = true })

-- print and change working directory
vim.keymap.set("n", "<leader>pp", ":pwd<cr>", { desc = "Print", silent = true })
vim.keymap.set("n", "<leader>pg", ":cd %:h<cr>", { desc = "Change to current buffer (global)", silent = true })
vim.keymap.set("n", "<leader>pl", ":lcd %:h<cr>", { desc = "Change to current buffer (local)", silent = true })

-- show files of current directory and directory tree
vim.keymap.set("n", "<leader>l", ":! ls -lAhv --group-directories-first<cr>", { desc = "ls", silent = true })
vim.keymap.set("n", "<leader>t", ":! tree -avn --dirsfirst -I '.git|node_modules|env'<cr>", { desc = "tree", silent = true })

-- remove trailing whitespace and only save if there was any
vim.keymap.set("n", "<leader>rw", ":windo %s/\\s\\+$//ge<cr>:windo update<cr>:echo 'Remove trailing whitespace of all windows'<cr>", { desc = "Remove trailing whitespace of all windows", silent = true })

-- search word where cursor hovers over
vim.keymap.set("n", "<leader>n", "viwy/<C-r>\"<cr>", { desc = "Search for word under cursor", silent = true })

-- search and replace in file
vim.keymap.set("n", "<leader>S", ":%s///g<Left><Left><Left>", { desc = "Search and replace", silent = true })

-- window commands (window navigation set in `lua/plugins/vim-tmux-navigator.lua`)
vim.keymap.set("n", "<C-up>", ":resize +2<cr>", { desc = "Resize window up", silent = true })
vim.keymap.set("n", "<C-down>", ":resize -2<cr>", { desc = "Resize window down", silent = true })
vim.keymap.set("n", "<C-right>", ":vertical resize +2<cr>", { desc = "Resize window right", silent = true })
vim.keymap.set("n", "<C-left>", ":vertical resize -2<cr>", { desc = "Resize window left", silent = true })
vim.keymap.set("n", "<leader>=", ":wincmd =<cr>", { desc = "Equalize all window sizes", silent = true })

-- open neovim config files
vim.keymap.set("n", "<A-n>", ":update<CR>:e $HOME/.config/nvim/init.lua<cr>", { desc = "Open init.lua", silent = true })

-- jump back to the originally opened file (Buffer 1)
vim.keymap.set("n", "<A-o>", ":update<CR>:b 1<cr>", { desc = "Jump back to originally opened buffer", silent = true })

-- yank
vim.keymap.set("n", "Y", "y$", { silent = true }) -- to the end of the line
vim.keymap.set("n", "<C-y>", "ggVGy", { desc = "Yank entire file", silent = true }) -- entire content of current file

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
vim.keymap.set("n", "<leader>u2", function() vim.cmd("MasonUpdate") end, { desc = "Mason registries", silent = true })
vim.keymap.set("n", "<leader>u3", function() vim.cmd("TSUpdate") end, { desc = "Treesitter", silent = true })

-- make
vim.keymap.set("n", "<leader>m", function() vim.cmd("! make") end, { desc = "make", silent = true })
