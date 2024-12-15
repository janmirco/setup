return {
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "clangd",
                    "cmake",
                    "fortls",
                    "jsonls",
                    "lua_ls",
                    "pyright",
                    "ruff",
                    "texlab",
                    "vimls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.diagnostic.config({
                signs = false,
                underline = true,
                virtual_text = { spacing = 4 },
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function()
                vim.keymap.set("n", "<leader>L", function() vim.lsp.stop_client(vim.lsp.get_clients()) end, { desc = "[LSP] Stop client", silent = true })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "[LSP] Hover", silent = true })
                vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "[LSP] Show signature help", silent = true }) -- when typing function arguments
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.goto_prev()
                    vim.cmd("normal zz")
                end, { desc = "[LSP] Previous diagnostic", silent = true })
                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.goto_next()
                    vim.cmd("normal zz")
                end, { desc = "[LSP] Next diagnostic", silent = true })
                vim.keymap.set("n", "gC", vim.lsp.buf.code_action, { desc = "[LSP] Code action", silent = true })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[LSP] Go to declaration", silent = true })
                vim.keymap.set("n", "gI", ":lua =vim.lsp.get_active_clients()[1].server_capabilities<cr>", { desc = "[LSP] Show server capabilities", silent = true })
                vim.keymap.set("n", "gR", vim.lsp.buf.rename, { desc = "[LSP] Rename", silent = true })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[LSP] Go to definition", silent = true })
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[LSP] List implementations in quickfix", silent = true })
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[LSP] List references in quickfix", silent = true })
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "[LSP] Go to type definition", silent = true })
            end

            -- lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim", "require" } },
                        workspace = {
                            library = {
                                vim.fn.stdpath("config"),
                                vim.fn.stdpath("data") .. "/lazy",
                            },
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            -- c/c++
            if vim.env.EDITOR_FULL_LSP_POWER == "yes" then
                lspconfig.clangd.setup({ capabilities = capabilities, on_attach = on_attach })
            else
                lspconfig.clangd.setup({
                    capabilities = capabilities,
                    on_attach = function(client, _)
                        local namespace = vim.lsp.diagnostic.get_namespace(client.id)
                        vim.diagnostic.disable(nil, namespace)
                        on_attach()
                    end,
                })
            end

            -- language servers without special setup
            lspconfig.bashls.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.cmake.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.fortls.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.jsonls.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach, handlers = { ["textDocument/publishDiagnostics"] = function() end } })
            lspconfig.ruff.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.rust_analyzer.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.texlab.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.vimls.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.zls.setup({ capabilities = capabilities, on_attach = on_attach })
        end,
    },
}
