return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local symbols = {
            Error = { icon = " ", priority = 50 },
            Warn  = { icon = " ", priority = 40 },
            Info  = { icon = " ", priority = 30 },
            Hint  = { icon = " ", priority = 20 },
        }
        for severity, opts in pairs(symbols) do
            local hl = "DiagnosticSign" .. severity
            vim.fn.sign_define(hl, {
                text = opts.icon,
                texthl = hl,
                numhl = hl,
                priority = opts.priority,
            })
        end

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = vim.split(package.path, ';'),
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            },
            pyright = {
                settings = {
                    python = {
                        pythonPath = "/opt/miniconda3/bin/python",
                    },
                },
            },
            tsserver = {},
            omnisharp = {},
            texlab = {},
            clangd = {
                settings = {
                    clangd = {
                        fallbackFlags = { "--style=file"}
                    }
                }
            },
        }

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                local telescope = require('telescope.builtin')
                vim.keymap.set('n', 'gd', telescope.lsp_definitions, { buffer = event.buf })
                vim.keymap.set('n', 'gr', telescope.lsp_references, { buffer = event.buf })
                vim.keymap.set('n', 'gi', telescope.lsp_implementations, { buffer = event.buf })
                vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { buffer = event.buf })
            end,
        });

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        require('mason-lspconfig').setup({
            ensure_installed = vim.tbl_keys(servers or {}),
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            }
        })
    end,
}
