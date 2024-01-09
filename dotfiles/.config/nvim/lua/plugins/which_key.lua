return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup({
            plugins = {
                presets = {
                    -- disable presets in order for which-key to not interfere with your keymaps like, e.g., gu (undo hunk) or gc (git commit)
                    operators = false,
                    motions = false,
                    text_objects = false,
                    windows = false,
                    nav = false,
                    z = false,
                    g = false,
                },
            },
            triggers_blacklist = {
                i = { "h", "j", "k", "(", "[", "{", "'", "\"", "`", "<", "$" },
            },
        })

        local dap = require("dap")
        local dapui = require("dapui")

        -- Every mapping in the following list can only be changed here and not in their respective configs!
        -- Use `desc` option in vim.keymap.set() to describe mapping.
        wk.register({
            ["<leader>"] = {
                name = "Leader",
                c = { name = "Comment and cquit" },
                d = {
                    name = "Debug",
                    ["1"] = { dap.disconnect, "<F3> Disconnect" },
                    ["2"] = { dap.toggle_breakpoint, "<F4> Toggle breakpoint" },
                    ["3"] = { dap.continue, "<F5> Continue" },
                    ["4"] = { dap.run_to_cursor, "<F6> Run to cursor" },
                    ["5"] = { dap.step_into, "<F7> Step into" },
                    ["6"] = { dap.step_over, "<F8> Step over" },
                    ["7"] = { dap.step_out, "<F9> Step out" },
                    ["8"] = { dapui.toggle, "<F10> Toggle UI" },
                },
                h = { name = "Harpoon" },
                o = { name = "only" },
                p = { name = "Working directory" },
                u = { name = "Update" },
            },
            ["["] = {
                name = "Previous",
                ["["] = { ":MkdnPrevHeading<cr>", "[Mkdnflow] Next header" },
            },
            ["]"] = {
                name = "Next",
                ["]"] = { ":MkdnNextHeading<cr>", "[Mkdnflow] Next header" },
            },
            f = {
                name = "Telescope",
                d = { name = "LSP" },
                g = { name = "Git" },
            },
            gw = { name = "[Git] Show commit" },
            t = {
                d = { name = "Todo Comments" },
                r = { name = "Trouble list" },
            },
        }, {})
    end,
}
