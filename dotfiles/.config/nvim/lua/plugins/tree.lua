return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })
        vim.keymap.set("n", "<A-t>", function()
            local reveal_file = vim.fn.expand("%:p")
            if reveal_file == "" then
                reveal_file = vim.fn.getcwd()
            else
                local f = io.open(reveal_file, "r")
                if f then
                    f.close(f)
                else
                    reveal_file = vim.fn.getcwd()
                end
            end
            require("neo-tree.command").execute({
                action = "focus",
                source = "filesystem",
                position = "left",
                reveal_file = reveal_file,
                reveal_force_cwd = true,
                toggle = true,
            })
        end, { desc = "Neo-tree toggle", silent = true })
    end,
}
