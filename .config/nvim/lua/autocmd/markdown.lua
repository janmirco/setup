local markdown_group = vim.api.nvim_create_augroup("MarkdownGroup", { clear = true })

-- =============================================================================================================================================================
--   Automatic formatting

vim.api.nvim_create_autocmd("BufWritePost", {
    group = markdown_group,
    pattern = { "*.md", "*.json" },
    callback = function() vim.cmd(":silent exec '! prettier --tab-width 4 --write %'") end,
})

-- =============================================================================================================================================================
--   Concealing

vim.api.nvim_create_autocmd("InsertEnter", {
    group = markdown_group,
    pattern = { "*.md" },
    callback = function() vim.wo.conceallevel = 0 end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
    group = markdown_group,
    pattern = { "*.md" },
    callback = function() vim.wo.conceallevel = 2 end,
})

-- =============================================================================================================================================================
--   Keymaps

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = markdown_group,
    pattern = { "markdown" },
    callback = function()
        -- Open file using enter key
        vim.keymap.set("n", "<CR>", function()
            local path = vim.fn.expand("<cfile>")
            if path:match("^https?://") or path:match("%.pdf$") or path:match("%.jpg$") or path:match("%.png$") or path:match("%.svg$") then
                vim.ui.open(path)
            else
                vim.cmd("normal! gf")
            end
        end, { desc = "Open file/url under cursor", silent = true })

        -- Toggle to-dos
        vim.keymap.set("n", "mt", function()
            local line = vim.api.nvim_get_current_line()
            if line:match("^%- %[ %]") then
                line = line:gsub("^%- %[ %]", "- [x]")
            elseif line:match("^%- %[[x]%]") then
                line = line:gsub("^%- %[[x]%]", "- [ ]")
            end
            vim.api.nvim_set_current_line(line)
        end, { desc = "Toggle to-dos", silent = true })

        -- Make sections italic/bold
        vim.keymap.set("n", "mi", function()
            local keys = vim.api.nvim_replace_termcodes("ciw*<C-r>\"*<esc>b", true, false, true)
            vim.api.nvim_feedkeys(keys, "n", true)
        end, { desc = "Make italic", silent = true })
        vim.keymap.set("n", "mb", function()
            local keys = vim.api.nvim_replace_termcodes("ciw**<C-r>\"**<esc>bb", true, false, true)
            vim.api.nvim_feedkeys(keys, "n", true)
        end, { desc = "Make bold", silent = true })
        vim.keymap.set("v", "mi", function()
            local keys = vim.api.nvim_replace_termcodes("c*<C-r>\"*<esc>b", true, false, true)
            vim.api.nvim_feedkeys(keys, "v", true)
        end, { desc = "Make italic", silent = true })
        vim.keymap.set("v", "mb", function()
            local keys = vim.api.nvim_replace_termcodes("c**<C-r>\"**<esc>bb", true, false, true)
            vim.api.nvim_feedkeys(keys, "v", true)
        end, { desc = "Make bold", silent = true })
        -- Remove italic/bold by using tpope/vim-surround together with tpope/vim-repeat:
        --   italic: ds*
        --   bold: ds*.
        --   bold italic: ds*..
    end,
})

-- =============================================================================================================================================================
--   Highlighting

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = markdown_group,
    pattern = { "*.md" },
    callback = function()
        -- Define highlight groups using Catppuccin palette
        local frappe = require("catppuccin.palettes").get_palette("frappe")
        vim.cmd("highlight MyMarkdownTag guifg=" .. frappe["flamingo"] .. " gui=bold")
        vim.cmd("highlight MyMarkdownURL gui=underline")
        vim.cmd("highlight MyMarkdownDone guifg=" .. frappe["overlay0"] .. " gui=strikethrough")

        -- Add matches
        vim.b.markdown_tag_match = vim.fn.matchadd("MyMarkdownTag", "#\\w\\+")
        vim.b.markdown_url_match = vim.fn.matchadd("MyMarkdownURL", "\\[[^\\]]*\\](\\([^\\)]*\\))")
        vim.b.markdown_done_match = vim.fn.matchadd("MyMarkdownDone", "\\-\\ \\[x\\].*")
    end,
})

-- Clear all markdown match IDs from any buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = markdown_group,
    pattern = { "*" },
    callback = function()
        local file_ext = vim.fn.expand("%:e")
        if file_ext ~= "md" then vim.fn.clearmatches() end
    end,
})

-- =============================================================================================================================================================
--   Specifically for TODO.md

-- Set up autocmd to update task counts on relevant events
local ns_id = vim.api.nvim_create_namespace("task_counts")
vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "TextChanged", "TextChangedI" }, {
    group = markdown_group,
    pattern = "TODO.md",
    callback = function()
        local buf = vim.api.nvim_get_current_buf()

        -- Remove colorcolumn
        vim.opt_local.colorcolumn = ""

        -- Clear previous extmarks in namespace
        vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1)

        -- Initialize necessary state variables
        local in_section = false
        local in_archive = false
        local section_start = 1
        local task_open_count = 0
        local task_done_count = 0
        local section_headers = {}

        -- Loop over all lines
        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        for i, line in ipairs(lines) do
            if line:match("^# ") then
                -- Save state variables of previous H1 section
                if in_section then section_headers[section_start] = { task_open_count, task_done_count, in_archive } end

                -- Reset state variables for next H1 section
                in_section = true
                if line:match("^# ARCHIVE") then
                    in_archive = true
                else
                    in_archive = false
                end
                section_start = i
                task_open_count = 0
                task_done_count = 0
            elseif in_section and line:match("^- %[ %]") then
                task_open_count = task_open_count + 1
            elseif in_section and line:match("^- %[x%]") then
                task_done_count = task_done_count + 1
            end
        end

        -- Save state variables of final H1 section
        if in_section then section_headers[section_start] = { task_open_count, task_done_count, in_archive } end

        -- Write virtual text next to H1 section headers
        for line_num, state in pairs(section_headers) do
            local open_count, done_count, archive = unpack(state)
            local virtual_text = ""
            if archive then
                virtual_text = " [" .. done_count .. " done tasks]"
            else
                if done_count == 0 then
                    virtual_text = " [" .. open_count .. " open tasks]"
                else
                    virtual_text = " [" .. open_count .. " open tasks, " .. done_count .. " done tasks]"
                end
            end
            vim.api.nvim_buf_set_extmark(buf, ns_id, line_num - 1, -1, {
                virt_text = { { virtual_text, "Comment" } },
                virt_text_pos = "eol",
            })
        end
    end,
})
