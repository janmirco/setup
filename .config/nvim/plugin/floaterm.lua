local default_window_dimensions = function(sfd)
    sfd.height = math.floor(vim.o.lines * 0.2)
    sfd.width = math.floor(vim.o.columns * 0.75)
    sfd.row = 2
    sfd.col = math.floor((vim.o.columns - sfd.width) / 2.0)
    return sfd
end

local create_floating_window = function(sf)
    -- Create buffer
    if not vim.api.nvim_buf_is_valid(sf.buf) then
        sf.buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_option(sf.buf, "filetype", "float") -- used in autocmd for all filetypes to disable colorcolumn and cursorline
    end

    -- Use stored window dimensions if available, otherwise calculate default
    if sf.dim.height == nil then sf.dim = default_window_dimensions(sf.dim) end

    -- Create window
    sf.win = vim.api.nvim_open_win(sf.buf, true, {
        style = "minimal",
        border = "rounded",
        relative = "editor",
        height = sf.dim.height,
        width = sf.dim.width,
        row = sf.dim.row,
        col = sf.dim.col,
    })

    return sf
end

-- Create an initial invalid floating window state
local state = {
    floating = { buf = -1, win = -1, dim = { height = nil, width = nil, row = nil, col = nil } },
}

local toggle_floaterm = function()
    if vim.api.nvim_win_is_valid(state.floating.win) then
        vim.api.nvim_win_hide(state.floating.win)
    else
        state.floating = create_floating_window(state.floating)
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd("terminal")
            vim.api.nvim_buf_set_option(state.floating.buf, "buflisted", false) -- ensures that terminal is not listed in bufferline
        end
        vim.cmd("startinsert")
    end
end

local update_window_config = function()
    vim.api.nvim_win_set_config(state.floating.win, {
        style = "minimal",
        border = "rounded",
        relative = "editor",
        height = state.floating.dim.height,
        width = state.floating.dim.width,
        row = state.floating.dim.row,
        col = state.floating.dim.col,
    })
end

local resize_floating_window = function(delta_height, delta_width)
    if not vim.api.nvim_win_is_valid(state.floating.win) then return end
    state.floating.dim.height = math.max(1, state.floating.dim.height + delta_height)
    state.floating.dim.width = math.max(1, state.floating.dim.width + delta_width)
    update_window_config()
end

local back_default_floating_window = function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then return end
    state.floating.dim = default_window_dimensions(state.floating.dim)
    update_window_config()
end

local move_floating_window = function(direction)
    if not vim.api.nvim_win_is_valid(state.floating.win) then return end
    if direction == "up" then
        state.floating.dim.row = math.floor(state.floating.dim.row - 1)
    elseif direction == "down" then
        state.floating.dim.row = math.floor(state.floating.dim.row + 1)
    elseif direction == "right" then
        state.floating.dim.col = math.floor(state.floating.dim.col + 1)
    elseif direction == "left" then
        state.floating.dim.col = math.floor(state.floating.dim.col - 1)
    elseif direction == "center" then
        state.floating.dim.row = math.floor((vim.o.lines - state.floating.dim.height) / 2.0)
        state.floating.dim.col = math.floor((vim.o.columns - state.floating.dim.width) / 2.0)
    end
    update_window_config()
end

vim.keymap.set({ "n", "i", "v", "t" }, "<A-m>", toggle_floaterm, { desc = "Toggle FloaTerm", silent = true })
vim.keymap.set({ "n", "t" }, "<A-Up>", function() resize_floating_window(2, 0) end, { desc = "Increase FloaTerm height", silent = true })
vim.keymap.set({ "n", "t" }, "<A-Down>", function() resize_floating_window(-2, 0) end, { desc = "Decrease FloaTerm height", silent = true })
vim.keymap.set({ "n", "t" }, "<A-Right>", function() resize_floating_window(0, 2) end, { desc = "Increase FloaTerm width", silent = true })
vim.keymap.set({ "n", "t" }, "<A-Left>", function() resize_floating_window(0, -2) end, { desc = "Decrease FloaTerm width", silent = true })
vim.keymap.set({ "n", "t" }, "<A-=>", back_default_floating_window, { desc = "FloaTerm back to default position and size", silent = true })
vim.keymap.set({ "n", "t" }, "<A-S-Up>", function() move_floating_window("up") end, { desc = "Move FloaTerm up", silent = true })
vim.keymap.set({ "n", "t" }, "<A-S-Down>", function() move_floating_window("down") end, { desc = "Move FloaTerm down", silent = true })
vim.keymap.set({ "n", "t" }, "<A-S-Right>", function() move_floating_window("right") end, { desc = "Move FloaTerm right", silent = true })
vim.keymap.set({ "n", "t" }, "<A-S-Left>", function() move_floating_window("left") end, { desc = "Move FloaTerm left", silent = true })
vim.keymap.set({ "n", "t" }, "<A-S-=>", function() move_floating_window("center") end, { desc = "Move FloaTerm to center", silent = true })
