return {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "AckslD/nvim-neoclip.lua", config = function() require("neoclip").setup({ keys = { telescope = { i = { paste = "<cr>" } } } }) end },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
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
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    mappings = {
                        i = {
                            ["<A-y>"] = yank_current_selection,
                            ["<Tab>"] = actions.move_selection_next,
                            ["<S-Tab>"] = actions.move_selection_previous,
                        },
                        n = {
                            ["<A-y>"] = yank_current_selection,
                        },
                    },
                    file_ignore_patterns = {
                        "^.git/",
                        "^__pycache__/",
                        "^env/",
                        "^venv/",
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
                        "--smart-case",
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            telescope.load_extension("fzf")
            telescope.load_extension("harpoon")
            telescope.load_extension("ui-select")

            local builtin = require("telescope.builtin")
            local utils = require("telescope.utils")

            -- find files in current directory
            vim.keymap.set("n", "ff", function() builtin.find_files({ hidden = true, no_ignore = true }) end, { desc = "Find files in current directory", silent = true })

            -- find files in directory of buffer
            vim.keymap.set("n", "fF", function() builtin.find_files({ hidden = true, no_ignore = true, cwd = utils.buffer_dir() }) end, { desc = "Find files in directory of buffer", silent = true })

            -- find files in home
            vim.keymap.set("n", "fh", function() builtin.find_files({ hidden = true, no_ignore = true, cwd = vim.env.HOME }) end, { desc = "Find files in home", silent = true })

            -- find files in config
            vim.keymap.set("n", "fc", function() builtin.find_files({ hidden = true, no_ignore = true, cwd = vim.env.HOME .. "/.config" }) end, { desc = "Find files in home", silent = true })

            -- find files in nvim directory
            vim.keymap.set("n", "fn", function() builtin.find_files({ hidden = true, cwd = vim.fn.stdpath("config") }) end, { desc = "Find files in nvim directory", silent = true })

            -- find .md files in current directory
            vim.keymap.set("n", "fm", function() builtin.find_files({ hidden = true, no_ignore = true, search_file = "*.md" }) end, { desc = "Find .md files in current directory", silent = true })

            -- xdg-open file
            local xdg_find = function(cwd)
                builtin.find_files({
                    hidden = true,
                    no_ignore = true,
                    cwd = cwd,
                    attach_mappings = function(_, map)
                        map({ "i", "n" }, "<cr>", function(prompt_bufnr)
                            local entry = action_state.get_selected_entry()
                            actions.close(prompt_bufnr)
                            vim.cmd("call jobstart(\"xdg-open " .. cwd .. "/" .. entry.filename .. "\")")
                        end)
                        return true -- needs to return true if you want to map default_mappings and false if not
                    end,
                })
            end
            -- in current directory
            vim.keymap.set("n", "fo", function() xdg_find(utils.buffer_dir()) end, { desc = "XDG-Open file in current directory", silent = true })
            -- in home
            vim.keymap.set("n", "fO", function() xdg_find(vim.env.HOME) end, { desc = "XDG-Open file in home", silent = true })

            -- find keymaps
            vim.keymap.set("n", "fk", builtin.keymaps, { desc = "Find keymaps", silent = true })

            -- find buffers
            vim.keymap.set("n", "fb", builtin.buffers, { desc = "Find buffers", silent = true })

            -- find files by using grep
            vim.keymap.set("n", "fl", builtin.live_grep, { desc = "Find files using grep", silent = true })

            -- find files by using grep in directory of buffer
            vim.keymap.set("n", "fL", function() builtin.live_grep({ cwd = utils.buffer_dir() }) end, { desc = "Find files using grep in directory of buffer", silent = true })

            -- find spell suggestions
            vim.keymap.set("n", "fs", builtin.spell_suggest, { desc = "Find spell suggestions", silent = true })

            -- find registers and edit with <C-e>
            vim.keymap.set("n", "fr", builtin.registers, { desc = "Find registers and edit with <C-e>", silent = true })

            -- find help tags
            vim.keymap.set("n", "fH", builtin.help_tags, { desc = "Find help tags", silent = true })

            -- find string in current buffer
            vim.keymap.set("n", "fB", builtin.current_buffer_fuzzy_find, { desc = "Find string in current buffer", silent = true })

            -- find string under cursor
            vim.keymap.set("n", "fS", builtin.grep_string, { desc = "Find string under cursor", silent = true })

            -- find yanks
            vim.keymap.set("n", "fN", ":Telescope neoclip<cr>", { desc = "Find yanks using neoclip", silent = true })

            -- find man pages
            vim.keymap.set("n", "fM", builtin.man_pages, { desc = "Find man pages", silent = true })

            -- find treesitter symbols
            vim.keymap.set("n", "ft", builtin.treesitter, { desc = "Find treesitter symbols", silent = true })

            -- find planets
            vim.keymap.set("n", "fp", builtin.planets, { desc = "Find planets", silent = true })

            -- find files tracked by git
            vim.keymap.set("n", "fgf", builtin.git_files, { desc = "Find tracked files", silent = true })

            -- find files tracked by git in directory of buffer
            vim.keymap.set("n", "fgF", function() builtin.git_files({ cwd = utils.buffer_dir() }) end, { desc = "Find tracked files in directory of buffer", silent = true })

            -- git status
            vim.keymap.set("n", "fgs", builtin.git_status, { desc = "Status", silent = true })

            -- find git commits in git log
            vim.keymap.set("n", "fgl", builtin.git_commits, { desc = "Find commits in log", silent = true })

            -- find git branches
            vim.keymap.set("n", "fgb", builtin.git_branches, { desc = "Find branches", silent = true })

            -- find diagnostics
            vim.keymap.set("n", "fdd", builtin.diagnostics, { desc = "Find diagnostics", silent = true })

            -- find lsp workspace symbols
            vim.keymap.set("n", "fds", builtin.lsp_workspace_symbols, { desc = "Find workspace symbols", silent = true })

            -- find lsp document symbols
            vim.keymap.set("n", "fdS", builtin.lsp_document_symbols, { desc = "Find document symbols", silent = true })

            -- find lsp references for word under the cursor
            vim.keymap.set("n", "fdr", builtin.lsp_references, { desc = "Find references", silent = true })
        end,
    },
}
