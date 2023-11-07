-- remap gv (reselection in visual mode) for use with git
vim.keymap.set("n", "gV", "gv")


-- -- for testing your own plugin
-- vim.keymap.set("n", "<leader>tt", "<plug>JelloHello", {silent = true})


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
vim.keymap.set("n", "<A-e>", function() toggle_spell("en_us") end)
vim.keymap.set("n", "<A-d>", function() toggle_spell("de") end)

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
vim.keymap.set("n", "<A-w>", toggle_winbar)


-- toggle light theme
local toggle_light = function()
    local dark_on = vim.api.nvim_eval("&background") == "dark"
    if dark_on then
        vim.opt.background = "light"
    else
        vim.opt.background = "dark"
    end
    vim.cmd("source " .. vim.env.HOME .. "/.config/nvim/init.lua")
end
vim.keymap.set("n", "<A-l>", toggle_light)


-- toggle any option
local toggle = function(option)
    vim.opt[option] = not (vim.api.nvim_eval("&" .. option) == 1)
end
vim.keymap.set("n", "<A-z>", function() toggle("wrap") end)
vim.keymap.set("n", "<A-R>", function() toggle("relativenumber") end)


-- standard commands mapped with leader
vim.keymap.set("n", "<leader>a", ":write<cr>:qall<cr>")
vim.keymap.set("n", "<leader>r", function() vim.cmd("edit"); print(vim.fn.expand("%:t") .. " reloaded") end)
vim.keymap.set("n", "<leader>W", function() vim.cmd("write"); print(vim.fn.expand("%:t") .. " written") end)
vim.keymap.set("n", "<leader>w", function() vim.cmd("update"); print(vim.fn.expand("%:t") .. " updated") end)
vim.keymap.set("n", "<leader>Q", ":qall<cr>")
vim.keymap.set("n", "<leader>cq", ":cq<cr>")
vim.keymap.set("n", "<leader>e", ":edit ")
vim.keymap.set("n", "<leader>v", ":vsplit ")
vim.keymap.set("n", "<leader>s", ":split ")


-- close every window except for the current one
vim.keymap.set("n", "<leader>ow", function() vim.cmd("update"); vim.cmd("only"); print("Closed all windows except: " .. vim.fn.expand("%:t")) end)


-- source init.lua
vim.keymap.set("n", "<leader>5", ":source %<cr>")


-- print and change working directory
vim.keymap.set("n", "<leader>p", ":pwd<cr>")
vim.keymap.set("n", "<leader>pg", ":cd %:h<cr>")
vim.keymap.set("n", "<leader>pl", ":lcd %:h<cr>")


-- show files of current directory and directory tree
vim.keymap.set("n", "<leader>l", ":! ls -lAhv --group-directories-first<cr>")
vim.keymap.set("n", "<leader>t", ":! tree -avn --dirsfirst -I '.git|node_modules|env'<cr>")


-- remove trailing whitespace and only save if there was any
vim.keymap.set("n", "<leader>rw", ":windo %s/\\s\\+$//ge<cr>:windo update<cr>:echo 'Remove trailing whitespace of all windows'<cr>")


-- search word where cursor hovers over
vim.keymap.set("n", "<leader>n", "viwy/<C-r>\"<cr>")


-- search and replace in file
vim.keymap.set("n", "<leader>S", ":%s///g<Left><Left><Left>")


-- buffers
vim.keymap.set("n", "<leader>q", ":bdelete<cr>", {silent = true})
vim.keymap.set("n", "<Tab>", ":bnext<cr>", {silent = true})
vim.keymap.set("n", "<BS>", ":bprevious<cr>", {silent = true})
vim.keymap.set("n", "<A-b>", "<C-o>")
vim.keymap.set("n", "<A-f>", "<C-i>")


-- window commands
vim.keymap.set("n", "<C-h>", ":wincmd h<cr>", {silent = true})
vim.keymap.set("n", "<C-j>", ":wincmd j<cr>", {silent = true})
vim.keymap.set("n", "<C-k>", ":wincmd k<cr>", {silent = true})
vim.keymap.set("n", "<C-l>", ":wincmd l<cr>", {silent = true})
vim.keymap.set("n", "<A-=>", ":resize +3<cr>", {silent = true})
vim.keymap.set("n", "<A-->", ":resize -3<cr>", {silent = true})
vim.keymap.set("n", "<A-.>", ":vertical resize +3<cr>", {silent = true})
vim.keymap.set("n", "<A-,>", ":vertical resize -3<cr>", {silent = true})
vim.keymap.set("n", "<leader>=", ":wincmd =<cr>", {silent = true})


-- wrapping text with parentheses, brackets, curly braces, single/double quotation marks, ...
vim.keymap.set("n", "<leader>(", "ciw(<C-r>\")<Esc>b")
vim.keymap.set("n", "<leader>[", "ciw[<C-r>\"]<Esc>b")
vim.keymap.set("n", "<leader>{", "ciw{<C-r>\"}<Esc>b")
vim.keymap.set("n", "<leader>'", "ciw'<C-r>\"'<Esc>b")
vim.keymap.set("n", "<leader>\"", "ciw\"<C-r>\"\"<Esc>b")
vim.keymap.set("n", "<leader>`", "ciw`<C-r>\"`<Esc>b")
vim.keymap.set("n", "<leader><", "ciw<<C-r>\"><Esc>b")
vim.keymap.set("n", "<leader>*", "ciw*<C-r>\"*<Esc>b")
vim.keymap.set("n", "<leader>~", "ciw~<C-r>\"~<Esc>b")
vim.keymap.set("n", "<leader>$", "ciw$<C-r>\"$<Esc>b")
vim.keymap.set("n", "<leader>.", "ciw.<C-r>\".<Esc>b")
vim.keymap.set("n", "<leader>,", "ciw,<C-r>\",<Esc>b")
vim.keymap.set("n", "<leader>:", "ciw:<C-r>\":<Esc>b")
vim.keymap.set("n", "<leader>;", "ciw;<C-r>\";<Esc>b")


-- folding
vim.keymap.set("n", "<leader>zm", ":set foldmethod=manual<cr>")
vim.keymap.set("n", "<leader>zs", ":set foldmethod=syntax<cr>")
vim.keymap.set("v", "<leader>zf", ":'<,'>fold<cr>")


-- open neovim config files
vim.keymap.set("n", "<A-n>", ":update<CR>:e $HOME/.config/nvim/init.lua<cr>")
vim.keymap.set("n", "<A-c>", ":update<CR>:e $HOME/.config/nvim/coc-settings.json<cr>")


-- open note
local date = os.date("%Y-%m-%d")
local note_path = "$HOME/Documents/cam/research/jp/jp/notes/" .. date .. "_note.md"
vim.keymap.set("n", "<C-n>", ":update<cr>:e " .. note_path .. "<cr>")


-- jump back to the originally opened file (Buffer 1)
vim.keymap.set("n", "<A-o>", ":update<CR>:b 1<cr>")


-- yank to the end of the line
vim.keymap.set("n", "Y", "y$")


-- keeping it centered
vim.keymap.set("n", "n", "nzz", {silent = true})
vim.keymap.set("n", "N", "Nzz", {silent = true})
vim.keymap.set("n", "J", "maJ`a:delmarks a<cr>", {silent = true})

-- move current line
vim.keymap.set("n", "<A-j>", "<S-v>dp", {silent = true})
vim.keymap.set("n", "<A-k>", "<S-v>dkP", {silent = true})

-- function OpenFileUnderCursor()
--     let current_path = expand('%:p:h')
--     let file_under_cursor = expand('<cfile>')
--     let entire = current_path . '/' . file_under_cursor
--     execute('!xdg-open '.entire)
-- endfunction
-- nmap <F8> :call OpenFileUnderCursor()<CR><CR>


-- open help menu for word under cursor
vim.keymap.set("n", "H", "yiw:help <C-r>\"<cr>")


-- access text from registers
vim.keymap.set("n", "<leader>1", "\"1p")
vim.keymap.set("n", "<leader>2", "\"2p")
vim.keymap.set("n", "<leader>3", "\"3p")
vim.keymap.set("n", "<leader>4", "\"4p")


-- -- sessions
-- --     store an editing session with `:mksession <PATH>/<NAME_OF_SESSION>`
-- --     get back into this editing session with `nvim -S <PATH>/<NAME_OF_SESSION>`
-- local split = function(str, sep)
--     if sep == nil then
--         sep = "%s"
--     end
--     local t = {}
--     for s in string.gmatch(str, "([^" .. sep .. "]+)") do
--         table.insert(t, s)
--     end
--     return t
-- end
-- local make_session_with_automatic_name = function()
--     local dir = ""
--     for _, value in pairs(split(vim.fn.getcwd(), "/")) do dir = value end
--     local session = "$HOME/.config/nvim/sessions/session_" .. dir .. ".vim"
--     vim.cmd(":mksession " .. session)
--     print("Saved session: " .. session)
-- end
-- vim.keymap.set("n", "<A-s>", ":mksession! $HOME/.config/nvim/sessions/last_session.vim<cr>")
-- vim.keymap.set("n", "<A-S>", make_session_with_automatic_name)
local zen_mode_toggle = function()
    require("zen-mode").toggle({
        window = {
            options = {
                signcolumn = "no",
                number = false,
                relativenumber = false,
                cursorline = false,
                cursorcolumn = false,
                foldcolumn = "0",
                list = false,
            },
        },
    })
end
vim.keymap.set("n", "<A-s>", zen_mode_toggle, {silent = true})


-- updating
vim.keymap.set("n", "<leader>u1", ":PlugUpgrade<cr>")
vim.keymap.set("n", "<leader>u2", ":PlugUpdate<cr>")
vim.keymap.set("n", "<leader>u3", ":CocUpdate<cr>")
vim.keymap.set("n", "<leader>u4", ":TSUpdate<cr>")
