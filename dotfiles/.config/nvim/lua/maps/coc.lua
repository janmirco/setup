vim.keymap.set("n", "gk", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.keymap.set("n", "gj", "<Plug>(coc-diagnostic-next)", {silent = true})

vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
vim.keymap.set("n", "ge", "<Plug>(coc-declaration)", {silent = true})

vim.keymap.set("n", "g-", ":CocDiagnostics<cr>", {silent = true})

vim.keymap.set("n", "<leader>gd", ":CocDisable<cr>", {silent = true})
vim.keymap.set("n", "<leader>gr", ":CocRestart<cr>", {silent = true})

vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

vim.keymap.set("x", "<leader>gf", "<Plug>(coc-format-selected)", {silent = true})
vim.keymap.set("n", "<leader>gf", "<Plug>(coc-format-selected)", {silent = true})

-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true, expr = true}
vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
vim.keymap.set("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
vim.keymap.set("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
