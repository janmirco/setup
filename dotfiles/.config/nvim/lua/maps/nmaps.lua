-- remap gv (reselection in visual mode) for use with git
vim.keymap.set("n", "gV", "gv")


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
vim.keymap.set("n", "<A-W>", toggle_winbar)


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
vim.keymap.set("n", "<A-w>", function() toggle("wrap") end)
vim.keymap.set("n", "<A-R>", function() toggle("relativenumber") end)


-- standard commands mapped with leader
vim.keymap.set("n", "<leader>r", function() vim.cmd("edit"); print(vim.fn.expand("%:t") .. " reloaded") end)
vim.keymap.set("n", "<leader>w", function() vim.cmd("write"); print(vim.fn.expand("%:t") .. " written") end)
vim.keymap.set("n", "<leader>W", function() vim.cmd("wall"); print("All files written") end)
vim.keymap.set("n", "<leader>Q", function() vim.cmd("qall") end)
vim.keymap.set("n", "<leader>a", function() vim.cmd("wall"); vim.cmd("qall") end)
vim.keymap.set("n", "<leader>cq", function() vim.cmd("cquit") end)
vim.keymap.set("n", "<leader>e", ":edit ")
vim.keymap.set("n", "<leader>v", ":vsplit ")
vim.keymap.set("n", "<leader>s", ":split ")


-- buffers
vim.keymap.set("n", "<leader>q", ":bdelete<cr>")
vim.keymap.set("n", "<Tab>", ":bnext<cr>", {silent = true})
vim.keymap.set("n", "<BS>", ":bprevious<cr>", {silent = true})
vim.keymap.set("n", "<A-b>", "<C-o>")
vim.keymap.set("n", "<A-f>", "<C-i>")


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


-- window commands (window navigation set in `lua/plugins/vim-tmux-navigator.lua`)
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


-- open help menu for word under cursor
vim.keymap.set("n", "H", "yiw:help <C-r>\"<cr>")


-- access text from registers
vim.keymap.set("n", "<leader>1", "\"1p")
vim.keymap.set("n", "<leader>2", "\"2p")
vim.keymap.set("n", "<leader>3", "\"3p")
vim.keymap.set("n", "<leader>4", "\"4p")


-- updating
vim.keymap.set("n", "<leader>u1", ":Lazy update<cr>")
vim.keymap.set("n", "<leader>u2", ":CocUpdate<cr>")
vim.keymap.set("n", "<leader>u3", ":TSUpdate<cr>")


-- manual file formatting
vim.cmd("autocmd BufEnter * nmap <silent> <Leader><Leader> magg=G`a:delmarks a<CR>:echo '[VimFormat] Formatted file'<CR>")
vim.cmd("autocmd BufEnter *.go nmap <silent> <Leader><Leader> :update<CR>:! go fmt %<CR><CR>:e %<CR>:echo '[GoFormat] Formatted Go file with go fmt'<CR>")
vim.cmd("autocmd BufEnter *.py nmap <silent> <Leader><Leader> :update<CR>:! python3 -m isort --profile=black --line-length=1000 %<CR><CR>:e %<CR>:! python3 -m black --line-length=1000 %<CR><CR>:e %<CR>:echo '[PyFormat] Formatted Python file with isort & Black'<CR>")
vim.cmd("autocmd BufEnter *.rs nmap <silent> <Leader><Leader> :update<cr>:! rustfmt %<cr><cr>:e %<cr>:echo '[RustFormat] Formatted Rust file with rustfmt'<CR>")
vim.cmd("autocmd BufEnter *.tex nmap <silent> <Leader><Leader> magg=G=G`a:delmarks a<CR>:echo '[VimFormat] Formatted TeX file'<CR>")
vim.cmd("autocmd BufEnter *.cpp,*.hpp,*.c,*.h nmap <silent> <Leader><Leader> :update<cr>:! clang-format -i --style=file:$HOME/.config/nvim/.clang-format %<cr><cr>:e %<cr>:echo '[CppFormat] Formatted C/C++ file with clang-format'<cr>")
