return {
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "1.*",
        config = function()
            require("typst-preview").setup({
                open_cmd = "chromium %s",
            })
            vim.keymap.set("n", "<A-p>", "<cmd>TypstPreview<cr>", { silent = true })

            -- Open file using enter key
            vim.keymap.set("n", "<CR>", function()
                local path = vim.fn.expand("<cfile>")
                if path:match("^https?://") or path:match("%.pdf$") or path:match("%.jpg$") or path:match("%.png$") or path:match("%.svg$") then
                    vim.ui.open(path)
                else
                    vim.cmd.edit(path)
                end
            end, { desc = "Open file/url under cursor", silent = true })

            -- Paste clipboard content as Typst link
            vim.keymap.set({ "n", "v" }, "mp", function()
                -- Get current mode
                local mode = vim.fn.mode()

                -- Get word under cursor or visual selection
                local word = ""
                if mode == "n" then
                    word = vim.fn.expand("<cword>")
                else
                    word = table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos(".")), "\n")
                end

                -- Get system clipboard content
                local clipboard = vim.fn.getreg("+")

                -- Create Typst link out of word and clipboard
                local typst_link = string.format("#link(\"%s\", [%s])", clipboard, word)

                -- Remove word under cursor or visual selection
                if mode == "n" then
                    vim.cmd("normal diw")
                else
                    vim.cmd("normal d")
                end

                -- Insert Typst link at cursor position
                vim.api.nvim_put({ typst_link }, "c", false, true)
            end, { desc = "Paste clipboard content as Typst link around word under cursor", silent = true })

            -- Make sections italic/bold
            vim.keymap.set("n", "mi", function()
                local keys = vim.api.nvim_replace_termcodes("ciw_<C-r>\"_<esc>b", true, false, true)
                vim.api.nvim_feedkeys(keys, "n", true)
            end, { desc = "Make italic", silent = true })
            vim.keymap.set("n", "mb", function()
                local keys = vim.api.nvim_replace_termcodes("ciw*<C-r>\"*<esc>bb", true, false, true)
                vim.api.nvim_feedkeys(keys, "n", true)
            end, { desc = "Make bold", silent = true })
            vim.keymap.set("v", "mi", function()
                local keys = vim.api.nvim_replace_termcodes("c_<C-r>\"_<esc>b", true, false, true)
                vim.api.nvim_feedkeys(keys, "v", true)
            end, { desc = "Make italic", silent = true })
            vim.keymap.set("v", "mb", function()
                local keys = vim.api.nvim_replace_termcodes("c*<C-r>\"*<esc>bb", true, false, true)
                vim.api.nvim_feedkeys(keys, "v", true)
            end, { desc = "Make bold", silent = true })
            -- Remove italic/bold by using tpope/vim-surround together with tpope/vim-repeat:
            --   italic: ds_
            --   bold: ds*
        end,
    },
}
