return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local servers = {
            lua_ls = {},
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
            clangd = {},
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
