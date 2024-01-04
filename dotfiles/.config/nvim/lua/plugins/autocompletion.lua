return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "f3fora/cmp-spell",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "kdheepak/cmp-latex-symbols",
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            view = {
                entries = { name = "custom", selection_order = "near_cursor" },
            },
            mapping = cmp.mapping.preset.insert({
                -- C-b (back) C-f (forward) for snippet placeholder navigation
                ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- up
                ["<C-d>"] = cmp.mapping.scroll_docs(4), -- down
                ["<C-e>"] = cmp.mapping.close(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lua" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer", option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end } },
                { name = "spell" },
                { name = "path" },
                { name = "latex_symbols" },
            }),
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "symbol_text",
                    menu = {
                        buffer = "[Buffer]",
                        latex_symbols = "[Latex]",
                        luasnip = "[LuaSnip]",
                        nvim_lsp = "[LSP]",
                        nvim_lua = "[NvimLua]",
                        path = "[Path]",
                        spell = "[Spell]",
                    },
                }),
            },
            snippet = {
                expand = function(args) luasnip.lsp_expand(args.body) end,
            },
        })
    end,
}
