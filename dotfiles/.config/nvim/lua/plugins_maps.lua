-- alpha
vim.keymap.set("n", "<A-a>", ":Alpha<cr>", {silent = true})


-- coc
require("coc_maps")


-- floaterm
vim.keymap.set("n", "<A-m>", ":FloatermToggle<cr>", {silent = true})
vim.keymap.set("n", "<A-r>", ":FloatermToggle<cr>ranger<cr>", {silent = true})
vim.keymap.set("n", "<leader>m", ":FloatermToggle<cr>make<cr>", {silent = true})


-- fugitive
vim.keymap.set("n", "gs", ":Git<cr>", {silent = true})
vim.keymap.set("n", "gl", ":Git log<cr>", {silent = true})
vim.keymap.set("n", "gc", ":Git commit<cr>", {silent = true})
vim.keymap.set("n", "gb", ":Git blame<cr>", {silent = true})
vim.keymap.set("n", "gv", ":Gvdiffsplit<cr>", {silent = true})
vim.keymap.set("n", "gm", ":Gvdiffsplit!<cr>", {silent = true})
vim.keymap.set("n", "g,", ":diffget //2<cr>:echo '[GitMerge] Grabbed from left side'<cr>", {silent = true})
vim.keymap.set("n", "g.", ":diffget //3<cr>:echo '[GitMerge] Grabbed from right side'<cr>", {silent = true})


-- gitgutter
vim.keymap.set("n", "<A-g>", ":GitGutterToggle<cr>:echo '[GitGutter] Toggle'<cr>", {silent = true})
vim.keymap.set("n", "<leader>k", ":GitGutterPrevHunk<cr>zz", {silent = true})
vim.keymap.set("n", "<leader>j", ":GitGutterNextHunk<cr>zz", {silent = true})
vim.keymap.set("n", "gp", ":GitGutterPreviewHunk<cr>", {silent = true})
vim.keymap.set("n", "gu", ":GitGutterUndoHunk<cr>", {silent = true})
vim.keymap.set("n", "gh", ":GitGutterStageHunk<cr>", {silent = true})


-- indentline
vim.keymap.set("n", "<A-i>", ":IndentLinesToggle<cr>", {silent = true})


-- luasnip
require("luasnip_maps")


-- markdown-preview
vim.keymap.set("n", "<A-p>", "<Plug>MarkdownPreview", {silent = true})


-- maximizer
vim.keymap.set("n", "<A-x>", ":MaximizerToggle<cr>", {silent = true})
vim.keymap.set("v", "<A-x>", ":MaximizerToggle<cr>gV", {silent = true, remap = true})
vim.keymap.set("i", "<A-x>", "<C-o>:MaximizerToggle<cr>", {silent = true})


-- nvim-tree
vim.keymap.set("n", "<A-t>", ":NvimTreeFindFileToggle<cr>zz", {silent = true})


-- telescope
require("telescope_maps")


-- vimspector
vim.keymap.set("n", "<F3>", ":call vimspector#Reset()<cr>", {silent = true})
vim.keymap.set("n", "<F4>", ":call vimspector#Restart()<cr>", {silent = true})
vim.keymap.set("n", "<F5>", ":call vimspector#Continue()<cr>", {silent = true})
vim.keymap.set("n", "<F6>", ":call vimspector#ToggleBreakpoint()<cr>", {silent = true})
vim.keymap.set("n", "<F7>", ":VimspectorWatch ", {silent = true})
vim.keymap.set("n", "<F8>", ":VimspectorEval ", {silent = true})
vim.keymap.set("n", "<F9>", ":call vimspector#RunToCursor()<cr>", {silent = true})
vim.keymap.set("n", "<F10>", ":call vimspector#StepOver()<cr>", {silent = true})
vim.keymap.set("n", "<F11>", ":call vimspector#StepInto()<cr>", {silent = true})
vim.keymap.set("n", "<F12>", ":call vimspector#StepOut()<cr>", {silent = true})
