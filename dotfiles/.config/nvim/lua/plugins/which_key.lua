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
            [","] = { name = "[Noice]" },
            ["["] = { name = "Previous" },
            ["]"] = { name = "Next" },
            f = {
                name = "Telescope",
                d = { name = "LSP" },
                g = { name = "Git" },
            },
            gh = { name = "[Git] Stage" },
            gu = { name = "[Git] Undo" },
            gw = { name = "[Git] Show commit" },
            t = {
                d = { name = "Todo Comments" },
                r = { name = "Trouble list" },
            },
        }, {})

        -- register specific markdown keymap descriptions
        local buf = vim.api.nvim_get_current_buf()
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        if ft == "markdown" then
            wk.register({
                ["]l"] = { ":MkdnNextLink<cr>", "[Mkdnflow] Next link" },
                ["[l"] = { ":MkdnPrevLink<cr>", "[Mkdnflow] Previous link" },
                ["]]"] = { ":MkdnNextHeading<cr>", "[Mkdnflow] Next header" },
                ["[["] = { ":MkdnPrevHeading<cr>", "[Mkdnflow] Previous header" },
                m = {
                    name = "[Mkdnflow]",
                    p = { ":MkdnCreateLinkFromClipboard<cr>", "CreateLinkFromClipboard" },
                    s = { ":MkdnTagSpan<cr>", "TagSpan" },
                    r = { ":MkdnMoveSource<cr>", "MoveSource" },
                    y = {
                        name = "Yank",
                        a = { ":MkdnYankAnchorLink<cr>", "AnchorLink" },
                        f = { ":MkdnYankFileAnchorLink<cr>", "FileAnchorLink" },
                    },
                    j = { ":MkdnIncreaseHeading<cr>", "IncreaseHeading" },
                    k = { ":MkdnDecreaseHeading<cr>", "DecreaseHeading" },
                    t = { ":MkdnToggleToDo<cr>", "ToggleToDo" },
                    n = { ":MkdnUpdateNumbering<cr>", "UpdateNumbering" },
                    f = { ":MkdnFoldSection<cr>", "FoldSection" },
                    F = { ":MkdnUnfoldSection<cr>", "UnfoldSection" },
                },
            }, {})
        end
    end,
}
