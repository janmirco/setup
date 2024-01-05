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
                    "texlab",
                    "vimls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function()
                local opts = { silent = true }
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set({ "n", "v" }, "<leader>dc", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "<leader>df", function() vim.lsp.buf.format({ async = true }) end, opts)
                vim.keymap.set("n", "<leader>dh", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, opts)
                vim.keymap.set("n", "<leader>dr", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>dt", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<leader>dwa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set("n", "<leader>dwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
                vim.keymap.set("n", "<leader>dwr", vim.lsp.buf.remove_workspace_folder, opts)
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
            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = function(client, _)
                    local namespace = vim.lsp.diagnostic.get_namespace(client.id)
                    vim.diagnostic.disable(nil, namespace)
                    on_attach()
                end,
            })

            -- language servers without special setup
            lspconfig.bashls.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.cmake.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.fortls.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.jsonls.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.texlab.setup({ capabilities = capabilities, on_attach = on_attach })
            lspconfig.vimls.setup({ capabilities = capabilities, on_attach = on_attach })
        end,
    },
}
