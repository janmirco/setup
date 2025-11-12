local servers = {
    bashls = false,
    clangd = false,
    cmake = false,
    docker_language_server = false,
    fortls = false,
    jsonls = false,
    lua_ls = "special",
    pyright = "special",
    ruff = false,
    rust_analyzer = false,
    texlab = false,
    tinymist = false,
    vimls = false,
    zls = false,
}

local language_servers = vim.tbl_keys(servers)

return {
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = language_servers,
                automatic_enable = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        priority = 4000,
        lazy = false,
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Use same symbols as diagnostics from lualine
            local symbols = {
                icons = {
                    error = "󰅚 ", -- x000f015a
                    warn = "󰀪 ", -- x000f002a
                    info = "󰋽 ", -- x000f02fd
                    hint = "󰌶 ", -- x000f0336
                },
                no_icons = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
            }

            vim.diagnostic.config({
                underline = true,
                virtual_lines = { current_line = true },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = symbols.icons.error,
                        [vim.diagnostic.severity.WARN] = symbols.icons.warn,
                        [vim.diagnostic.severity.INFO] = symbols.icons.info,
                        [vim.diagnostic.severity.HINT] = symbols.icons.hint,
                    },
                },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function()
                vim.keymap.set("n", "<A-I>", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "[LSP] Toggle inlay hint", silent = true })
                vim.keymap.set("n", "<leader>L", function() vim.lsp.stop_client(vim.lsp.get_clients()) end, { desc = "[LSP] Stop client", silent = true })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "[LSP] Hover", silent = true })
                vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "[LSP] Show signature help", silent = true }) -- when typing function arguments
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.goto_prev()
                    vim.defer_fn(function() vim.cmd("normal! zz") end, 10) -- delay in ms
                end, { desc = "[LSP] Previous diagnostic", silent = true })
                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.goto_next()
                    vim.defer_fn(function() vim.cmd("normal! zz") end, 10) -- delay in ms
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

            -- language servers without special setup
            for server, special in pairs(servers) do
                if not special then vim.lsp.config(server, {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }) end
            end

            -- lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                on_attach = on_attach,
                root_markers = { "lazy-lock.json" },
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

            -- python
            vim.lsp.config("pyright", {
                capabilities = capabilities,
                on_attach = on_attach,
                handlers = { ["textDocument/publishDiagnostics"] = function() end },
            })

            -- enable all language servers
            vim.lsp.enable(language_servers)

            -- use temporary fix to avoid race condition when using nvim v0.11+ and lazy package manager
            -- different solution would be to move LSP config outside of lazy.nvim
            local lsp_group = vim.api.nvim_create_augroup("LSPAttachAugroup", { clear = true })
            vim.api.nvim_create_autocmd("VimEnter", {
                group = lsp_group,
                callback = function()
                    local bufnr = vim.api.nvim_get_current_buf()
                    local filename = vim.api.nvim_buf_get_name(bufnr)
                    if filename ~= "" and vim.bo[bufnr].buftype == "" then
                        -- Re-edit the file to trigger LSP attach
                        vim.cmd("edit!")
                    end
                end,
            })
        end,
    },
}
