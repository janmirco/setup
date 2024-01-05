return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup()

        local telescope_builtin = require("telescope.builtin")
        local dap = require("dap")
        local dapui = require("dapui")
        wk.register({
            f = {
                name = "Telescope",
                F = { ":Telescope find_files hidden=true no_ignore=true cwd=", "Find file in specific directory" },
                f = { function() telescope_builtin.find_files({ hidden = true, no_ignore = true }) end, "Find file in current directory" },
                h = { function() telescope_builtin.find_files({ hidden = true, no_ignore = true, cwd = vim.env.HOME }) end, "Find files in home" },
                n = { function() telescope_builtin.find_files({ hidden = true, cwd = vim.fn.stdpath("config") }) end, "Find files in nvim directory" },
                k = { telescope_builtin.keymaps, "Find keymaps" },
                b = { telescope_builtin.buffers, "Find buffers" },
                l = { telescope_builtin.live_grep, "Find files using grep" },
                s = { telescope_builtin.spell_suggest, "Find spell suggestions" },
                r = { telescope_builtin.registers, "Find registers and edit with <C-e>" },
                t = { telescope_builtin.help_tags, "Find help tags" },
                B = { telescope_builtin.current_buffer_fuzzy_find, "Find string in current buffer" },
                g = {
                    name = "Git",
                    F = { telescope_builtin.git_files, "Find files tracked by git" },
                    s = { telescope_builtin.git_status, "Git status" },
                    l = { telescope_builtin.git_commits, "Find git commits in git log" },
                    b = { telescope_builtin.git_branches, "Find git branches" },
                },
                d = {
                    name = "LSP",
                    d = { telescope_builtin.diagnostics, "Find diagnostics" },
                    s = { telescope_builtin.lsp_workspace_symbols, "Find LSP workspace symbols" },
                    S = { telescope_builtin.lsp_document_symbols, "Find LSP document symbols" },
                    r = { telescope_builtin.lsp_references, "Find LSP references" },
                },
            },
            ["["] = { d = { vim.diagnostic.goto_prev, "Previous diagnostic" } },
            ["]"] = { d = { vim.diagnostic.goto_next, "Next diagnostic" } },
            ["<leader>"] = {
                c = { name = "Comment" },
                d = {
                    name = "LSP",
                    c = { vim.lsp.buf.code_action, "Selects a code action available at the current cursor position" },
                    e = { vim.diagnostic.open_float, "Show diagnostics in a floating window" },
                    f = { function() vim.lsp.buf.format({ async = true }) end, "Formats a buffer using the attached (and optionally filtered) language server clients" },
                    h = { vim.lsp.buf.signature_help, "Displays signature information about the symbol under the cursor in a floating window" },
                    q = { vim.diagnostic.setloclist, "Add buffer diagnostics to the location list" },
                    r = { vim.lsp.buf.rename, "Renames all references to the symbol under the cursor" },
                    t = { vim.lsp.buf.type_definition, "Jumps to the definition of the type of the symbol under the cursor" },
                    w = {
                        name = "Workspace",
                        a = { vim.lsp.buf.add_workspace_folder, "Add the folder at path to the workspace folders. If {path} is not provided, the user will be prompted for a path using input()." },
                        l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders" },
                        r = { vim.lsp.buf.remove_workspace_folder, "Remove the folder at path from the workspace folders. If {path} is not provided, the user will be prompted for a path using input()." },
                    },
                },
                h = { name = "Harpoon" },
                u = {
                    name = "Update",
                    ["1"] = { function() require("lazy").update({ wait = true }) end, "Lazy" },
                    ["2"] = { function() vim.cmd("MasonUpdate") end, "Mason" },
                    ["3"] = { function() vim.cmd("TSUpdate") end, "Treesitter" },
                },
            },
            g = {
                d = { vim.lsp.buf.definition, "Jumps to the definition of the symbol under the cursor" },
                D = { vim.lsp.buf.declaration, "Jumps to the declaration of the symbol under the cursor" },
                r = { vim.lsp.buf.references, "Lists all the references to the symbol under the cursor in the quickfix window" },
                i = { vim.lsp.buf.implementation, "Lists all the implementations for the symbol under the cursor in the quickfix window" },
            },
            d = {
                ["1"] = { dap.disconnect, "[Debug] <F3> Disconnect" },
                ["2"] = { dap.toggle_breakpoint, "[Debug] <F4> Toggle breakpoint" },
                ["3"] = { dap.continue, "[Debug] <F5> Continue" },
                ["4"] = { dap.run_to_cursor, "[Debug] <F6> Run to cursor" },
                ["5"] = { dap.step_into, "[Debug] <F7> Step into" },
                ["6"] = { dap.step_over, "[Debug] <F8> Step over" },
                ["7"] = { dap.step_out, "[Debug] <F9> Step out" },
                ["8"] = { dapui.toggle, "[Debug] <F10> Toggle UI" },
            },
        }, {})
    end,
}
