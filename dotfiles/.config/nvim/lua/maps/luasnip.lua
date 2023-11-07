local ls = require("luasnip")

-- expand or jump forward
vim.keymap.set(
    {"i", "s"},
    "<A-j>",
    function() if ls.expand_or_jumpable() then ls.expand_or_jump() end end,
    {silent = true}
)

-- jump backward
vim.keymap.set(
    {"i", "s"},
    "<A-k>",
    function() if ls.jumpable(-1) then ls.jump(-1) end end,
    {silent = true}
)

-- selecting within list of options
vim.keymap.set(
    "i",
    "<A-l>",
    function() if ls.choice_active() then ls.change_choice(1) end end
)
