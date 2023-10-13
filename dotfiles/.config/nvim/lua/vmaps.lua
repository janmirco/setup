-- wrapping text with parentheses, brackets, curly braces, single/double quotation marks, ...
vim.keymap.set("v", "<leader>(",  "c(<C-r>\")<Esc>b")
vim.keymap.set("v", "<leader>[",  "c[<C-r>\"]<Esc>b")
vim.keymap.set("v", "<leader>{",  "c{<C-r>\"}<Esc>b")
vim.keymap.set("v", "<leader>'",  "c'<C-r>\"'<Esc>b")
vim.keymap.set("v", "<leader>\"", "c\"<C-r>\"\"<Esc>b")
vim.keymap.set("v", "<leader>`",  "c`<C-r>\"`<Esc>b")
vim.keymap.set("v", "<leader><",  "c<<C-r>\"><Esc>b")
vim.keymap.set("v", "<leader>*",  "c*<C-r>\"*<Esc>b")
vim.keymap.set("v", "<leader>~",  "c~<C-r>\"~<Esc>b")
vim.keymap.set("v", "<leader>$",  "c$<C-r>\"$<Esc>b")
vim.keymap.set("v", "<leader>.",  "c.<C-r>\".<Esc>b")
vim.keymap.set("v", "<leader>,",  "c,<C-r>\",<Esc>b")
vim.keymap.set("v", "<leader>:",  "c:<C-r>\":<Esc>b")
vim.keymap.set("v", "<leader>;",  "c;<C-r>\";<Esc>b")


-- revisualize after shifting
vim.keymap.set("v", ">", ">gV", {remap = true})
vim.keymap.set("v", "<", "<gV", {remap = true})


-- increase and decrease numbers in bulk
vim.keymap.set("v", "<C-a>", "<C-a>gV", {remap = true})
vim.keymap.set("v", "<C-x>", "<C-x>gV", {remap = true})
vim.keymap.set("v", "g<C-a>", "g<C-a>gV", {remap = true})
vim.keymap.set("v", "g<C-x>", "g<C-x>gV", {remap = true})


-- sort lines
vim.keymap.set("v", "<leader>s", ":sort u<cr>")


-- search and replace selected string in file
vim.keymap.set("v", "<leader>S", "y:%s/<C-r>\"//g<left><left>")


-- search for highlighted area
vim.keymap.set("v", "<leader>n", "y/<C-r>\"<cr>")


-- store text in registers
vim.keymap.set("v", "<leader>1", "\"1y")
vim.keymap.set("v", "<leader>2", "\"2y")
vim.keymap.set("v", "<leader>3", "\"3y")
vim.keymap.set("v", "<leader>4", "\"4y")
