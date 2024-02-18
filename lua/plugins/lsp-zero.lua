return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
        }
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = false,
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)
            lsp_zero.set_sign_icons({
                error = '',
                warn = '',
                hint = '',
                info = '',
            })
            -- -- Only show diagnostics on hover
            -- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
            --     vim.lsp.diagnostic.on_publish_diagnostics, {
            --         virtual_text = false,
            --         signs = true,
            --         update_in_insert = false,
            --     }
            -- )
            -- vim.o.updatetime = 250
            -- vim.cmd('autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(0, {scope = "line"})')
        end,
        dependencies = {
            'neovim/nvim-lspconfig',
        },
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('mason').setup({})
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        dependencies = {
            'williamboman/mason.nvim',
            'VonHeikemen/lsp-zero.nvim',
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            require('mason-lspconfig').setup({
                handlers = {
                    lsp_zero.default_setup,
                },
            })
        end,
    },
}
