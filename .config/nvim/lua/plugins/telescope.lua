return {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "AckslD/nvim-neoclip.lua", config = function() require("neoclip").setup({ keys = { telescope = { i = { paste = "<cr>" } } } }) end },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            local pickers = require("telescope.pickers")
            local previewers = require("telescope.previewers")
            local finders = require("telescope.finders")
            local config_values = require("telescope.config").values
            local themes = require("telescope.themes")

            local yank_current_selection = function(prompt_bufnr)
                local entry = action_state.get_selected_entry()
                vim.cmd("let @+ = '" .. entry.filename .. "'")
                actions.close(prompt_bufnr)
            end

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = "󰁔 ",
                    layout_config = { prompt_position = "top" },
                    sorting_strategy = "ascending",
                    mappings = {
                        i = {
                            ["<A-y>"] = yank_current_selection,
                            ["<Tab>"] = actions.move_selection_next,
                            ["<S-Tab>"] = actions.move_selection_previous,
                            ["<A-j>"] = "preview_scrolling_down", -- <C-d>
                            ["<A-k>"] = "preview_scrolling_up", -- <C-u>
                        },
                        n = {
                            ["<A-y>"] = yank_current_selection,
                        },
                    },
                    file_ignore_patterns = {
                        "^.git/",
                        "^.jj/",
                        "^__pycache__/",
                        "^env/",
                        "^venv/",
                        "^node_modules/",
                        "^.venv/",
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--hidden",
                        "--no-ignore-vcs",
                        "--glob",
                        "!{**/*egg-info/*,**/.*cache*/*,**/.byobu/*,**/.cache/*,**/.cargo/*,**/.config/abiword/*,**/.config/akonadi/*,**/.config/autostart/*,**/.config/BraveSoftware/*,**/.config/cat_installer/*,**/.config/cef_user_data/*,**/.config/coc/*,**/.config/Code/*,**/.config/dconf/*,**/.config/enchant/*,**/.config/fltk.org/*,**/.config/freerdp/*,**/.config/ghb/*,**/.config/GIMP/*,**/.config/google-chrome/*,**/.config/gtk-2.0/*,**/.config/gtk-3.0/*,**/.config/gtk-4.0/*,**/.config/htop/*,**/.config/ibus/*,**/.config/inkscape/*,**/.config/kde.org/*,**/.config/KDE/*,**/.config/kdeconnect/*,**/.config/kdedefaults/*,**/.config/khtml/*,**/.config/lazygit/*,**/.config/libaccounts-glib/*,**/.config/libreoffice/*,**/.config/menus/*,**/.config/microsoft-edge/*,**/.config/neofetch/*,**/.config/nvim/autoload/*,**/.config/nvim/undodir/*,**/.config/obs-studio/*,**/.config/obsidian/*,**/.config/octave/*,**/.config/ookla/*,**/.config/ParaView/*,**/.config/pavucontrol-qt/*,**/.config/pulse/*,**/.config/remmina/*,**/.config/sciebo/*,**/.config/session/*,**/.config/texstudio/*,**/.config/thefuck/*,**/.config/ticktick/*,**/.config/tmux/plugins*,**/.config/Unknown Organization/*,**/.config/VirtualBox/*,**/.config/vlc/*,**/.config/xm1/*,**/.config/xsettingsd/*,**/.dotnet/*,**/.fltk/*,**/.fonts/*,**/.git/*,**/.gnome/*,**/.gnupg/*,**/.imageio/*,**/.ipython/*,**/.java/*,**/.jj/*,**/.julia/*,**/.jupyter/*,**/.kde/*,**/.keras/*,**/.local/*,**/.Mathematica/*,**/.modular/*,**/.mozilla/*,**/.mplayer/*,**/.npm/*,**/.nv/*,**/.openjfx/cache/*,**/.org.jabref.gui.JabRefMain/*,**/.pki/*,**/.pulsesecure/*,**/.rpmdb/*,**/.rustup/*,**/.texlive2021/*,**/.thunderbird/*,**/.var/*,**/.Wolfram/*,**/.zoom/*,**/__pycache__/*,**/CATSettings/*,**/env/*,**/node_modules/*,**/snap/*,**/vbox/*,**/venv/*,**/.venv/*}",
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
                        themes.get_dropdown({}),
                    },
                },
            })
            telescope.load_extension("fzf")
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

            -- find marks
            vim.keymap.set("n", "fm", builtin.marks, { desc = "Find marks", silent = true })

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

            -- find files by using grep in open buffers
            vim.keymap.set("n", "fL", function() builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Buffers" }) end, { desc = "Find files using grep in open buffers", silent = true })

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

            -- pick a commit type and switch insert mode
            local conventional_commits_type = function(opts)
                pickers
                    .new(opts, {
                        prompt_title = "Commit type",
                        finder = finders.new_table({
                            results = {
                                -- See: https://github.com/commitizen/conventional-commit-types/blob/master/index.json
                                {
                                    type = "feat",
                                    title = "Features",
                                    description = {
                                        "A new feature",
                                    },
                                },
                                {
                                    type = "fix",
                                    title = "Bug Fixes",
                                    description = {
                                        "A bug fix",
                                    },
                                },
                                {
                                    type = "docs",
                                    title = "Documentation",
                                    description = {
                                        "Documentation only changes",
                                    },
                                },
                                {
                                    type = "style",
                                    title = "Styles",
                                    description = {
                                        "Changes that do not affect the",
                                        "meaning of the code (white-space,",
                                        "formatting, missing semi-colons, etc)",
                                    },
                                },
                                {
                                    type = "refactor",
                                    title = "Code Refactoring",
                                    description = {
                                        "A code change that neither fixes a",
                                        "bug nor adds a feature",
                                    },
                                },
                                {
                                    type = "perf",
                                    title = "Performance Improvements",
                                    description = {
                                        "A code change that improves",
                                        "performance",
                                    },
                                },
                                {
                                    type = "test",
                                    title = "Tests",
                                    description = {
                                        "Adding missing tests or correcting",
                                        "existing tests",
                                    },
                                },
                                {
                                    type = "build",
                                    title = "Builds",
                                    description = {
                                        "Changes that affect the build system",
                                        "or external dependencies",
                                    },
                                },
                                {
                                    type = "ci",
                                    title = "Continuous Integrations",
                                    description = {
                                        "Changes to the CI configuration files",
                                        "and scripts",
                                    },
                                },
                                {
                                    type = "chore",
                                    title = "Chores",
                                    description = {
                                        "Other changes that don't modify src",
                                        "or test files",
                                    },
                                },
                                {
                                    type = "revert",
                                    title = "Reverts",
                                    description = {
                                        "Reverts a previous commit",
                                    },
                                },
                            },
                            entry_maker = function(entry)
                                return {
                                    value = entry,
                                    display = entry.type,
                                    ordinal = entry.type,
                                }
                            end,
                        }),
                        sorter = config_values.generic_sorter(opts),
                        previewer = previewers.new_buffer_previewer({
                            title = "Description",
                            define_preview = function(self, entry)
                                vim.api.nvim_buf_set_lines(
                                    self.state.bufnr,
                                    0,
                                    0,
                                    true,
                                    vim.tbl_flatten({
                                        entry.value.title .. ":",
                                        "",
                                        entry.value.description,
                                    })
                                )
                            end,
                        }),
                        attach_mappings = function(prompt_bufnr)
                            actions.select_default:replace(function()
                                local entry = action_state.get_selected_entry()
                                actions.close(prompt_bufnr)
                                local keys = vim.api.nvim_replace_termcodes("i" .. entry.value.type, true, false, true)
                                vim.api.nvim_feedkeys(keys, "n", true)
                            end)
                            return true
                        end,
                    })
                    :find()
            end
            vim.keymap.set("n", "<leader>b", function()
                conventional_commits_type(themes.get_cursor({
                    layout_config = {
                        width = 56,
                        height = 15,
                    },
                }))
            end, { desc = "Pick commit type", silent = true })
        end,
    },
}
