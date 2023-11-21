require("harpoon").setup({
    global_settings = {
        enter_on_sendcmd = true, -- run command immediately when calling `sendCommand`
    }
})

vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { silent = true })

local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>ht", harpoon_ui.toggle_quick_menu, { silent = true })
vim.keymap.set("n", "<leader>hn", harpoon_ui.nav_next, { silent = true })
vim.keymap.set("n", "<leader>hp", harpoon_ui.nav_prev, { silent = true })
vim.keymap.set("n", "<leader>h1", function() harpoon_ui.nav_file(1) end, { silent = true })
vim.keymap.set("n", "<leader>h2", function() harpoon_ui.nav_file(2) end, { silent = true })
vim.keymap.set("n", "<leader>h3", function() harpoon_ui.nav_file(3) end, { silent = true })
vim.keymap.set("n", "<leader>h4", function() harpoon_ui.nav_file(4) end, { silent = true })
vim.keymap.set("n", "<leader>h5", function() harpoon_ui.nav_file(5) end, { silent = true })

local harpoon_term = require("harpoon.tmux")
vim.keymap.set("n", "<leader>t1", function() harpoon_term.gotoTerminal(1) end, { silent = true })
vim.keymap.set("n", "<leader>t2", function() harpoon_term.gotoTerminal(2) end, { silent = true })
vim.keymap.set("n", "<leader>t3", function() harpoon_term.gotoTerminal(3) end, { silent = true })
vim.keymap.set("n", "<leader>t4", function() harpoon_term.gotoTerminal(4) end, { silent = true })
vim.keymap.set("n", "<leader>t5", function() harpoon_term.gotoTerminal(5) end, { silent = true })
local send_make = function()
    if vim.env.TMUX ~= nil then
        harpoon_term.sendCommand(1, "make")
    else
        vim.cmd("! make")
    end
end
vim.keymap.set("n", "<leader>m", send_make, { silent = true })

vim.keymap.set("n", "<leader>hm", ":Telescope harpoon marks<cr>", { silent = true })
