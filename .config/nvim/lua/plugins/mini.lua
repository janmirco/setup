return {
    { "echasnovski/mini.ai", version = "*", config = function() require("mini.ai").setup() end },
    { "echasnovski/mini.move", version = "*", config = function() require("mini.move").setup() end },
    { "echasnovski/mini.pairs", version = "*", config = function() require("mini.pairs").setup({ modes = { command = true } }) end },
}
