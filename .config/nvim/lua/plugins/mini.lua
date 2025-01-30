return {
    { "echasnovski/mini.ai", version = "*", config = function() require("mini.ai").setup() end },
    {
        "echasnovski/mini.files",
        version = "*",
        config = function()
            local mini_files = require("mini.files")
            mini_files.setup({
                mappings = {
                    go_in = "l",
                    go_in_plus = "<CR>",
                    go_out_plus = "h",
                },
            })
            vim.keymap.set("n", "-", function()
                if not mini_files.close() then mini_files.open() end
            end, { desc = "mini.files toggle", silent = true })
        end,
    },
    { "echasnovski/mini.move", version = "*", config = function() require("mini.move").setup() end },
    { "echasnovski/mini.pairs", version = "*", config = function() require("mini.pairs").setup({ modes = { command = true } }) end },
}
