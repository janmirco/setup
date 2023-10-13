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
telescope.load_extension("fzf")
telescope.load_extension("coc")
