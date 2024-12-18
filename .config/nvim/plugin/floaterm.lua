local create_floating_window = function(opts)
    -- Create buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_option(buf, "filetype", "float") -- used in autocmd for all filetypes to disable colorcolumn and cursorline
    end

    -- Calculate window dimensions
    local height = math.floor(vim.o.lines * 0.8)
    local width = math.floor(vim.o.columns * 0.8)
    local row = math.floor((vim.o.lines - height) / 2.0)
    local col = math.floor((vim.o.columns - width) / 2.0)

    -- Create window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        height = height,
        width = width,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    return { buf = buf, win = win }
end

-- Create an initial invalid floating window state
local state = { floating = { buf = -1, win = -1 } }

local toggle_floaterm = function()
    if vim.api.nvim_win_is_valid(state.floating.win) then
        vim.api.nvim_win_hide(state.floating.win)
    else
        state.floating = create_floating_window({ buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd("terminal")
            vim.api.nvim_buf_set_option(state.floating.buf, "buflisted", false) -- ensures that terminal is not listed in bufferline
        end
        vim.cmd("startinsert")
    end
end

vim.keymap.set({ "n", "i", "v", "t" }, "<A-m>", toggle_floaterm, { desc = "Toggle FloaTerm", silent = true })
