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
    if mixed_same_line ~= nil and mixed_same_line > 0 then
        return msg .. mixed_same_line
    end
    local space_indent_cnt = vim.fn.searchcount({pattern=space_pat, max_count=1e3}).total
    local tab_indent_cnt =  vim.fn.searchcount({pattern=tab_pat, max_count=1e3}).total
    if space_indent_cnt > tab_indent_cnt then
        return msg .. tab_indent
    else
        return msg .. space_indent
    end
end

local show_spell = function()
    local spell_on = vim.api.nvim_eval("&spell") == 1
    local language = vim.api.nvim_eval("&spelllang")
    return spell_on and "SPELL: " .. language or ""
end

-- additional sections to default setup
require("lualine").setup({
    sections = {
        lualine_b = {
            "branch",
            "diff",
            "diagnostics",
            {show_spell},
        },
        lualine_c = {
            "filename",
            "g:coc_status",
        },
        lualine_z = {
            "location",
            {show_mi, color = {bg = "#ffc2c2"}, separator = {left = ""}},
            {show_tw, color = {bg = "#ff6379"}, separator = {left = ""}},
        }
    },
    -- options = {
    --     refresh = {  -- this will meddle with the realtime update of gitgutter !
    --         statusline = 100,
    --         tabline = 100,
    --         winbar = 100,
    --     }
    -- }
})