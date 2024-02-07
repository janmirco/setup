return {
    "stevearc/oil.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            use_default_keymaps = false,
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["g."] = "actions.toggle_hidden",
            },
            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set("n", "-", ":Oil<cr>", { desc = "Open parent directory" })
    end,
}
