return {
    "nvim-lualine/lualine.nvim",
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
        local show_noice = function()
            local mode = noice.api.status.mode.get()
            if string.match(mode, "recording") then
                return mode
            elseif string.match(mode, "VISUAL") then
                -- only works with start of previously selected region
                local row_start, col_start = unpack(vim.api.nvim_buf_get_mark(0, "<"))
                local row_current, col_current = unpack(vim.api.nvim_win_get_cursor(0))
                local rows_selected = math.abs(row_current - row_start)
                local cols_selected = math.abs(col_current - col_start)
                return tostring(rows_selected + 1) .. ":" .. tostring(cols_selected + 1)
            end
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
                    { show_noice, cond = noice.api.status.mode.has },
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
