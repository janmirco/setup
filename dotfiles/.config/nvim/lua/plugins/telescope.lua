local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local yank_current_selection = function(prompt_bufnr)
    local entry = action_state.get_selected_entry()
    vim.cmd("let @+ = '" .. entry.filename .. "'")
    actions.close(prompt_bufnr)
end

telescope.setup({
    defaults = {
        prompt_prefix = "> ",
        layout_config = {prompt_position = "top"},
        sorting_strategy = "ascending",
        mappings = {
            i = {
                ["<A-y>"] = yank_current_selection,
                ["<A-j>"] = actions.move_selection_next,
                ["<A-k>"] = actions.move_selection_previous
            },
            n = {
                ["<A-y>"] = yank_current_selection,
            }
        },
        file_ignore_patterns = {
            "^.git/",
            "^node_modules/",
        },
        vimgrep_arguments = {
            "rg",
            "--hidden",
            "--glob",
            "!.git/",
            "--glob",
            "!node_modules/",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,  -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,  -- override the file sorter
            case_mode = "smart_case",  -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
        }
    }
})
telescope.load_extension("coc")
telescope.load_extension("fzf")
telescope.load_extension("harpoon")

local builtin = require("telescope.builtin")

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
    function() builtin.find_files({hidden = true, no_ignore = true}) end,
    {silent = true}
)

-- find files in home
vim.keymap.set(
    "n",
    "fh",
    function()
        builtin.find_files({hidden = true, no_ignore = true, cwd = vim.env.HOME})
    end,
    {silent = true}
)

-- find files in nvim directory
vim.keymap.set(
    "n",
    "fn",
    function()
        builtin.find_files({hidden = true, cwd = vim.env.HOME .. "/.config/nvim"})
    end,
    {silent = true}
)

-- find keymaps
vim.keymap.set(
    "n",
    "fk",
    builtin.keymaps,
    {silent = true}
)

-- find buffers
vim.keymap.set(
    "n",
    "fb",
    builtin.buffers,
    {silent = true}
)

-- find files by using grep
vim.keymap.set(
    "n",
    "fl",
    builtin.live_grep,
    {silent = true}
)

-- find spell suggestions
vim.keymap.set(
    "n",
    "fs",
    builtin.spell_suggest,
    {silent = true}
)

-- show all registers and edit with <C-e>
vim.keymap.set(
    "n",
    "fr",
    builtin.registers,
    {silent = true}
)

-- find help tags
vim.keymap.set(
    "n",
    "ft",
    builtin.help_tags,
    {silent = true}
)

-- find string in current buffer
vim.keymap.set(
    "n",
    "fB",
    builtin.current_buffer_fuzzy_find,
    {silent = true}
)

-- find files tracked by git
vim.keymap.set(
    "n",
    "fg",
    builtin.git_files,
    {silent = true}
)

-- git status for current directory
vim.keymap.set(
    "n",
    "fgs",
    builtin.git_status,
    {silent = true}
)

-- find commits in git log
vim.keymap.set(
    "n",
    "fgl",
    builtin.git_commits,
    {silent = true}
)

-- find git branches
vim.keymap.set(
    "n",
    "fgb",
    builtin.git_branches,
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
