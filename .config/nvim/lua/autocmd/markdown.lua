local markdown_auto_format_group = vim.api.nvim_create_augroup("MarkdownAutoFormatGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    group = markdown_auto_format_group,
    pattern = { "*.md", "*.json" },
    callback = function() vim.cmd(":silent exec '! prettier --tab-width 4 --write %'") end,
})

local markdown_conceal_group = vim.api.nvim_create_augroup("MarkdownConcealGroup", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
    group = markdown_conceal_group,
    pattern = { "*.md" },
    callback = function() vim.wo.conceallevel = 0 end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
    group = markdown_conceal_group,
    pattern = { "*.md" },
    callback = function() vim.wo.conceallevel = 2 end,
})

local clear_syntax_highlighting = function()
    if vim.g.markdown_tag_match ~= nil and vim.g.markdown_tag_match >= 1 then
        vim.fn.matchdelete(vim.g.markdown_tag_match)
        vim.g.markdown_tag_match = nil
    end
    if vim.g.markdown_url_match ~= nil and vim.g.markdown_url_match >= 1 then
        vim.fn.matchdelete(vim.g.markdown_url_match)
        vim.g.markdown_url_match = nil
    end
end

local markdown_general_group = vim.api.nvim_create_augroup("MarkdownGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    group = markdown_general_group,
    pattern = { "markdown", "typst" },
    callback = function()
        -- create special syntax highlighting for markdown
        if vim.api.nvim_buf_get_name(0):match("%.md$") then
            -- Define highlight groups using Catppuccin palette
            local frappe = require("catppuccin.palettes").get_palette("frappe")
            vim.cmd("highlight MyMarkdownTag guifg=" .. frappe["mauve"] .. " gui=bold")
            vim.cmd("highlight MyMarkdownURL gui=underline")

            -- Clear existing matches if valid
            if vim.g.markdown_tag_match ~= nil and vim.g.markdown_tag_match >= 1 then vim.fn.matchdelete(vim.g.markdown_tag_match) end
            if vim.g.markdown_url_match ~= nil and vim.g.markdown_url_match >= 1 then vim.fn.matchdelete(vim.g.markdown_url_match) end

            -- Add matches
            vim.g.markdown_tag_match = vim.fn.matchadd("MyMarkdownTag", "#\\w\\+")
            vim.g.markdown_url_match = vim.fn.matchadd("MyMarkdownURL", "\\[[^\\]]*\\](\\([^\\)]*\\))")
        else
            clear_syntax_highlighting()
        end

        -- open file using enter key
        vim.keymap.set("n", "<CR>", function()
            local path = vim.fn.expand("<cfile>")
            if path:match("^https?://") or path:match("%.pdf$") or path:match("%.jpg$") or path:match("%.png$") or path:match("%.svg$") then
                vim.ui.open(path)
            else
                vim.cmd("normal! gf")
            end
        end, { desc = "Open file/url under cursor", silent = true })

        -- make sections italic/bold
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
        -- remove italic/bold by using tpope/vim-surround together with tpope/vim-repeat:
        --   italic: ds*
        --   bold: ds*.
        --   bold italic: ds*..
    end,
})

-- Set up autocmd to update task counts on relevant events
local markdown_task_count_group = vim.api.nvim_create_augroup("MarkdownTaskCountGroup", { clear = true })
local ns_id = vim.api.nvim_create_namespace("task_counts")
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "BufReadPost", "TextChanged", "TextChangedI" }, {
    group = markdown_task_count_group,
    pattern = "TODO.md",
    callback = function()
        if not vim.api.nvim_buf_get_name(0):match("TODO.md") then return end

        local buf = vim.api.nvim_get_current_buf()

        -- Clear previous extmarks in namespace
        vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1)

        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        local in_section = false
        local section_start = 0
        local task_count = 0
        local section_headers = {}

        for i, line in ipairs(lines) do
            if line:match("^# ") then
                if in_section then section_headers[section_start] = task_count end
                section_start = i - 1
                task_count = 0
                in_section = true
            elseif in_section and line:match("^- %[ %]") then
                task_count = task_count + 1
            end
        end

        if in_section then section_headers[section_start] = task_count end

        for line_num, count in pairs(section_headers) do
            vim.api.nvim_buf_set_extmark(buf, ns_id, line_num, -1, {
                virt_text = { { " [" .. count .. " open tasks]", "Comment" } },
                virt_text_pos = "eol",
            })
        end
    end,
})
