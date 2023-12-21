local todo_comments = require("todo-comments")
todo_comments.setup()

vim.keymap.set("n", "[t", function() todo_comments.jump_prev() end, { desc = "Previous todo comment" })
vim.keymap.set("n", "]t", function() todo_comments.jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "tt", function() vim.cmd("TodoTrouble") end, { silent = true })
vim.keymap.set("n", "tc", function() vim.cmd("TodoTelescope") end, { silent = true })
