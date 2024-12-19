return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
    config = function()
        local show_tw = function()
            local space = vim.fn.search([[\s\+$]], "nwc")
            return space ~= 0 and "TW:" .. space or ""
        end

        local show_mi = function()
            local space_pat = [[\v^ +]]
            local tab_pat = [[\v^\t+]]
            local space_indent = vim.fn.search(space_pat, "nwc")
            local tab_indent = vim.fn.search(tab_pat, "nwc")
            local mixed = (space_indent > 0 and tab_indent > 0)
            local mixed_same_line
            if not mixed then
                mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
                mixed = mixed_same_line > 0
            end
            if not mixed then return "" end
            local msg = "MI:"
            if mixed_same_line ~= nil and mixed_same_line > 0 then return msg .. mixed_same_line end
            local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
            local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
            if space_indent_cnt > tab_indent_cnt then
                return msg .. tab_indent
            else
                return msg .. space_indent
            end
        end

        local show_spell = function()
            if vim.api.nvim_eval("&spell") == 1 then
                return "󰓆 " .. vim.api.nvim_eval("&spelllang")
            else
                return ""
            end
        end

        local show_editor_mode = function()
            if vim.env.EDITOR_LIGHT == "yes" then
                return "🪶"
            elseif vim.env.EDITOR_FULL_LSP_POWER == "yes" then
                return "💪"
            else
                return ""
            end
        end

        local noice = require("noice")
        local show_selected_and_recording = function()
            local mode = string.lower(noice.api.status.mode.get())

            -- early returns for any non-visual mode
            if string.find(mode, "recording") then return mode end
            if not string.find(mode, "v") then return "" end

            -- get positions
            local start_pos = vim.fn.getpos("v")
            local end_pos = vim.fn.getpos(".")

            -- calculate number of lines and chars
            local rows = math.abs(end_pos[2] - start_pos[2]) + 1
            local cols = math.abs(end_pos[3] - start_pos[3]) + 1

            return string.format("%d:%d", rows, cols)
        end

        -- additional sections to default setup
        require("lualine").setup({
            sections = {
                lualine_b = {
                    { "branch", icon = "" },
                    "diff",
                    "diagnostics",
                },
                lualine_c = {
                    { show_editor_mode },
                    "filename",
                    { show_spell },
                },
                lualine_x = {
                    { show_selected_and_recording, cond = noice.api.status.mode.has },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
                lualine_z = {
                    "location",
                    { show_mi, color = { bg = "#ffc2c2" }, separator = { left = "" } },
                    { show_tw, color = { bg = "#ff6379" }, separator = { left = "" } },
                },
            },
            options = {
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                },
            },
        })
    end,
}
