local telescope = require("telescope.builtin")

-- find files in a specific working directory
vim.keymap.set(
    "n",
    "f",
    ":Telescope find_files hidden=true no_ignore=true cwd="
)

-- find files in current directory
vim.keymap.set(
    "n",
    "ff",
    function() telescope.find_files({hidden = true, no_ignore = true}) end,
    {silent = true}
)

-- find files in home
vim.keymap.set(
    "n",
    "fh",
    function()
        telescope.find_files({hidden = true, no_ignore = true, cwd = vim.env.HOME})
    end,
    {silent = true}
)

-- find files in nvim directory
vim.keymap.set(
    "n",
    "fn",
    function()
        telescope.find_files({hidden = true, cwd = vim.env.HOME .. "/.config/nvim"})
    end,
    {silent = true}
)

-- find keymaps
vim.keymap.set(
    "n",
    "fk",
    telescope.keymaps,
    {silent = true}
)

-- find buffers
vim.keymap.set(
    "n",
    "fb",
    telescope.buffers,
    {silent = true}
)

-- find files by using grep
vim.keymap.set(
    "n",
    "fl",
    telescope.live_grep,
    {silent = true}
)

-- find spell suggestions
vim.keymap.set(
    "n",
    "fs",
    telescope.spell_suggest,
    {silent = true}
)

-- show all registers and edit with <C-e>
vim.keymap.set(
    "n",
    "fr",
    telescope.registers,
    {silent = true}
)

-- find help tags
vim.keymap.set(
    "n",
    "ft",
    telescope.help_tags,
    {silent = true}
)

-- find string in current buffer
vim.keymap.set(
    "n",
    "fB",
    telescope.current_buffer_fuzzy_find,
    {silent = true}
)

-- find files tracked by git
vim.keymap.set(
    "n",
    "fg",
    telescope.git_files,
    {silent = true}
)

-- git status for current directory
vim.keymap.set(
    "n",
    "fgs",
    telescope.git_status,
    {silent = true}
)

-- find commits in git log
vim.keymap.set(
    "n",
    "fgl",
    telescope.git_commits,
    {silent = true}
)

-- find git branches
vim.keymap.set(
    "n",
    "fgb",
    telescope.git_branches,
    {silent = true}
)

-- find all workspace symbols (coc)
vim.keymap.set(
    "n",
    "fcs",
    ":Telescope coc workspace_symbols<cr>",
    {silent = true}
)

-- find all workspace symbols (coc)
vim.keymap.set(
    "n",
    "fcS",
    ":Telescope coc document_symbols<cr>",
    {silent = true}
)

-- find all workspace diagnostics (coc)
vim.keymap.set(
    "n",
    "fcd",
    ":Telescope coc workspace_diagnostics<cr>",
    {silent = true}
)

-- find all code actions (coc)
vim.keymap.set(
    "n",
    "fca",
    ":Telescope coc code_actions<cr>",
    {silent = true}
)
