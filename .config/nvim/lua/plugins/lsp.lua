local servers = {
    bashls = false,
    clangd = false,
    cmake = false,
    docker_language_server = false,
    fortls = false,
    harper_ls = "special",
    jsonls = false,
    lua_ls = "special",
    ols = false,
    pyright = false,
    ruff = false,
    rust_analyzer = false,
    texlab = false,
    tinymist = "special",
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
                automatic_enable = false,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        priority = 4000,
        lazy = false,
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

            local on_attach_keymaps = function(_, bufnr)
                local opts = function(desc)
                    return {
                        desc = desc,
                        silent = true,
                        buf = bufnr,
                    }
                end

                vim.keymap.set("n", "<A-I>", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts("[LSP] Toggle inlay hint"))
                vim.keymap.set("n", "<leader>L", function() vim.lsp.stop_client(vim.lsp.get_clients()) end, opts("LSP Stop client"))
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("[LSP] Hover"))
                vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts("[LSP] Previous diagnostic"))
                vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts("[LSP] Next diagnostic"))
                vim.keymap.set("n", "gc", vim.lsp.buf.code_action, opts("[LSP] Code action"))
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("[LSP] Go to declaration"))
                vim.keymap.set("n", "gI", ":lua =vim.lsp.get_active_clients()[1].server_capabilities<cr>", opts("[LSP] Show server capabilities"))
                vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts("[LSP] Rename"))
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("[LSP] Go to definition"))
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("[LSP] List implementations in quickfix"))
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("[LSP] List references in quickfix"))
                vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts("[LSP] Go to type definition"))
            end

            -- Language servers without special setup
            for server, special in pairs(servers) do
                if not special then vim.lsp.config(server, {
                    on_attach = function(client, bufnr) on_attach_keymaps(client, bufnr) end,
                }) end
            end

            -- Lua
            vim.lsp.config("lua_ls", {
                on_attach = function(client, bufnr) on_attach_keymaps(client, bufnr) end,
                root_markers = { "lazy-lock.json" },
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim", "require" } },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Harper
            vim.lsp.config("harper_ls", {
                on_attach = function(client, bufnr) on_attach_keymaps(client, bufnr) end,
                cmd = { "harper-ls", "--stdio" },
                filetypes = {
                    "asciidoc",
                    "markdown",
                    "tex",
                    "text",
                    "toml",
                    "typst",
                    "yaml",
                },
                capabilities = {
                    textDocument = {
                        semanticTokens = {
                            multilineTokenSupport = true,
                        },
                    },
                },
                settings = {
                    ["harper-ls"] = {
                        excludePatterns = {
                            "**/BIG_PICTURE.md",
                            "**/TODO.md",
                        },
                        userDictPath = "~/.config/harper-ls/dictionary.txt",
                        linters = {
                            UseTitleCase = false,
                        },
                    },
                },
            })

            -- Typst
            vim.lsp.config("tinymist", {
                on_attach = function(client, bufnr)
                    on_attach_keymaps(client, bufnr)

                    -- Automatically pin main.typ in current directory as main
                    vim.print(client.name)
                    client:exec_cmd({
                        title = "pin",
                        command = "tinymist.pinMain",
                        arguments = { vim.fn.getcwd() .. "/main.typ" },
                    }, { bufnr = bufnr })
                end,
            })

            -- Enable all language servers
            vim.lsp.enable(language_servers)

            -- Use temporary fix to avoid race condition when using nvim v0.11+ and lazy package manager.
            -- A different solution would be to move LSP config outside of lazy.nvim.
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
