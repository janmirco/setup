return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        config = function()
            local fzf_lua = require("fzf-lua")
            fzf_lua.setup({
                keymap = {
                    builtin = {
                        ["<A-j>"] = "preview-page-down",
                        ["<A-k>"] = "preview-page-up",
                    },
                },
                fzf_opts = {
                    ["--cycle"] = true,
                },
                files = { no_ignore = true },
            })
            vim.keymap.set("n", "ff", function() fzf_lua.files() end, { desc = "Find files in current directory", silent = true })
            vim.keymap.set("n", "fh", function() fzf_lua.files({ cwd = "~" }) end, { desc = "Find files in home directory", silent = true })
            vim.keymap.set("n", "fc", function() fzf_lua.files({ cwd = "~/.config" }) end, { desc = "Find files in config directory", silent = true })
            vim.keymap.set("n", "fn", function() fzf_lua.files({ cwd = "~/.config/nvim" }) end, { desc = "Find files in nvim directory", silent = true })
            vim.keymap.set("n", "fm", function() fzf_lua.marks() end, { desc = "Find marks", silent = true })
            vim.keymap.set("n", "fk", function() fzf_lua.keymaps() end, { desc = "Find keymaps", silent = true })
            vim.keymap.set("n", "fb", function() fzf_lua.buffers() end, { desc = "Find buffers", silent = true })
            vim.keymap.set("n", "fl", function() fzf_lua.lines() end, { desc = "Find files using live grep in open buffers", silent = true })
            vim.keymap.set("n", "fL", function() fzf_lua.live_grep() end, { desc = "Find files using live grep", silent = true })
            vim.keymap.set("n", "fs", function() fzf_lua.spell_suggest() end, { desc = "Find spell suggestions", silent = true })
            vim.keymap.set("n", "fr", function() fzf_lua.registers() end, { desc = "Find registers", silent = true })
            vim.keymap.set("n", "fH", function() fzf_lua.helptags() end, { desc = "Find help tags", silent = true })
            vim.keymap.set("n", "fM", function() fzf_lua.manpages() end, { desc = "Find man pages", silent = true })
            vim.keymap.set("n", "ft", function() fzf_lua.treesitter() end, { desc = "Find treesitter symbols", silent = true })
            vim.keymap.set("n", "fgf", function() fzf_lua.git_files() end, { desc = "Find Git tracked files", silent = true })
            vim.keymap.set("n", "fgs", function() fzf_lua.git_status() end, { desc = "Find Git status", silent = true })
            vim.keymap.set("n", "fgl", function() fzf_lua.git_commits() end, { desc = "Find Git commits in log", silent = true })
            vim.keymap.set("n", "fgb", function() fzf_lua.git_branches() end, { desc = "Find Git branches", silent = true })
            vim.keymap.set("n", "fdd", function() fzf_lua.lsp_document_diagnostics() end, { desc = "Find LSP document diagnostics", silent = true })
            vim.keymap.set("n", "fdD", function() fzf_lua.lsp_workspace_diagnostics() end, { desc = "Find LSP workspace diagnostics", silent = true })
            vim.keymap.set("n", "fds", function() fzf_lua.lsp_document_symbols() end, { desc = "Find LSP document symbols", silent = true })
            vim.keymap.set("n", "fdS", function() fzf_lua.lsp_workspace_symbols() end, { desc = "Find LSP workspace symbols", silent = true })
            vim.keymap.set("n", "fdr", function() fzf_lua.lsp_references() end, { desc = "Find LSP references", silent = true })
        end,
    },
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

            -- find files in directory of buffer
            vim.keymap.set("n", "fF", function() builtin.find_files({ hidden = true, no_ignore = true, cwd = utils.buffer_dir() }) end, { desc = "Find files in directory of buffer", silent = true })

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

            -- find string in current buffer
            vim.keymap.set("n", "fB", builtin.current_buffer_fuzzy_find, { desc = "Find string in current buffer", silent = true })

            -- find string under cursor
            vim.keymap.set("n", "fS", builtin.grep_string, { desc = "Find string under cursor", silent = true })

            -- find yanks
            vim.keymap.set("n", "fN", ":Telescope neoclip<cr>", { desc = "Find yanks using neoclip", silent = true })

            -- find planets
            vim.keymap.set("n", "fp", builtin.planets, { desc = "Find planets", silent = true })

            -- find files tracked by git in directory of buffer
            vim.keymap.set("n", "fgF", function() builtin.git_files({ cwd = utils.buffer_dir() }) end, { desc = "Find tracked files in directory of buffer", silent = true })

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
