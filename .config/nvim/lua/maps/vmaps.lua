-- revisualize after shifting
vim.keymap.set("v", ">", ">gV", { remap = true })
vim.keymap.set("v", "<", "<gV", { remap = true })

-- increase and decrease numbers in bulk
vim.keymap.set("v", "<C-a>", "<C-a>gV", { remap = true })
vim.keymap.set("v", "<C-x>", "<C-x>gV", { remap = true })
vim.keymap.set("v", "g<C-a>", "g<C-a>gV", { remap = true })
vim.keymap.set("v", "g<C-x>", "g<C-x>gV", { remap = true })

-- sort lines
vim.keymap.set("v", "<leader>s", ":sort i<cr>", { desc = "Sort", silent = true })
vim.keymap.set("v", "<leader>S", ":sort! i<cr>", { desc = "Sort reversed", silent = true })

-- search and replace selected string in file
vim.keymap.set("v", "<leader>r", "y:%s/<C-r>\"//g<left><left>", { desc = "Search and replace", silent = true })

-- search for highlighted area
vim.keymap.set("v", "<leader>n", "y/<C-r>\"<cr>zz", { desc = "Search", silent = true })

-- open help menu for highlighted area
vim.keymap.set("v", "H", "y:help <C-r>\"<cr>", { desc = "Help", silent = true })

-- store text in registers
vim.keymap.set("v", "<leader>1", "\"1y", { desc = "Put in register 1", silent = true })
vim.keymap.set("v", "<leader>2", "\"2y", { desc = "Put in register 2", silent = true })
vim.keymap.set("v", "<leader>3", "\"3y", { desc = "Put in register 3", silent = true })
vim.keymap.set("v", "<leader>4", "\"4y", { desc = "Put in register 4", silent = true })

-- print selected region
vim.keymap.set("v", "#", "g<c-g>", { desc = "Print selected region", silent = true })
