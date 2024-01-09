return {
    {
        "ggandor/leap.nvim",
        config = function() require("leap").add_default_mappings() end,
    },
    {
        "ggandor/leap-spooky.nvim",
        config = function()
            require("leap-spooky").setup()
            -- yirw[leap] -> yank in remote word

            -- switch y for c/d -> change/delete
            -- switch i for a -> around
            -- switch r for R -> remote from other windows
            -- switch r/R for m/M -> "magnetic" cursor moves to the targeted object and stays there
            -- switch w for p -> paragraph
        end,
    },
}
