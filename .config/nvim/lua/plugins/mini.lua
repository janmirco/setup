return {
    { "echasnovski/mini.ai", version = "*", config = function() require("mini.ai").setup() end },
    {
        "echasnovski/mini.files",
        version = "*",
        config = function()
            local mini_files = require("mini.files")
            mini_files.setup()
            vim.keymap.set("n", "-", function()
                if not mini_files.close() then mini_files.open() end
            end, { desc = "mini.files toggle", silent = true })
        end,
    },
    { "echasnovski/mini.move", version = "*", config = function() require("mini.move").setup() end },
    {
        "echasnovski/mini.pairs",
        version = "*",
        config = function()
            require("mini.pairs").setup({ modes = { command = true } })

            -- Insert `<>` pair if `<` is typed at line start, don't register for `<CR>`
            MiniPairs.map("i", "<", { action = "open", pair = "<>", neigh_pattern = "\r.", register = { cr = false } })
            MiniPairs.map("i", ">", { action = "close", pair = "<>", register = { cr = false } })

            -- Create symmetrical `$$` pair for LaTeX only in certain files
            local latex_pairs_group = vim.api.nvim_create_augroup("LatexPairsAugroup", { clear = true })
            vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter", "BufRead" }, {
                group = latex_pairs_group,
                pattern = { "*.bib", "*.tex", "*.md", "*.py" },
                callback = function() MiniPairs.map_buf(0, "i", "$", { action = "closeopen", pair = "$$" }) end,
            })
        end,
    },
}
