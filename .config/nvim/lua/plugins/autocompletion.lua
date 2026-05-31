return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
        keymap = {
            preset = "none",

            ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
            ["<C-e>"] = { "hide", "fallback" },
            ["<Enter>"] = { "accept", "fallback" }, -- Option `accept` will not automatically select (alternative would be `select_and_accept`). You have to use <Tab> first. This has the advantage of <Enter> always being recognized as a way of creating a new line without interruption from the completion menu. Not having uninterrupted <Tab> is no issue since you never use <Tab> after a word.

            ["<S-Tab>"] = { "select_prev", "fallback_to_mappings" },
            ["<Tab>"] = { "select_next", "fallback_to_mappings" },

            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },

            ["<A-j>"] = { "snippet_forward", "fallback" },
            ["<A-k>"] = { "snippet_backward", "fallback" },

            ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            menu = { max_height = 5 },
            documentation = { auto_show = false }, -- show/hide documentation with <C-space>
            list = { selection = { preselect = false, auto_insert = false } },
        },
        signature = { -- show/hide signature with <C-k>
            enabled = true,
            trigger = { enabled = false },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
