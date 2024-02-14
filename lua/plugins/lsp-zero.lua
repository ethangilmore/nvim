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
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'VonHeikemen/lsp-zero.nvim',
            'zbirenbaum/copilot.lua',
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                completion = {
                    autocomplete = false,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.close()
                        else
                            cmp.complete()
                        end
                    end),
                    ['<C-n>'] = cmp.mapping(function(fallback)
                        if vim.b.copilot_suggestion_hidden then
                            cmp.select_next_item()
                        elseif require('copilot.suggestion').is_visible() then
                            require('copilot.suggestion').next()
                        else
                            fallback()
                        end
                    end),
                    ['<C-p>'] = cmp.mapping(function(fallback)
                        if vim.b.copilot_suggestion_hidden then
                            cmp.select_prev_item()
                        elseif require('copilot.suggestion').is_visible() then
                            require('copilot.suggestion').prev()
                        else
                            fallback()
                        end
                    end),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if vim.b.copilot_suggestion_hidden then
                            cmp.confirm()
                        elseif require('copilot.suggestion').is_visible() then
                            require('copilot.suggestion').accept()
                        else
                            fallback()
                        end
                    end),
                })
            })

            cmp.event:on("menu_opened", function()
                vim.b.copilot_suggestion_hidden = true
            end)

            cmp.event:on("menu_closed", function()
              vim.b.copilot_suggestion_hidden = false
            end)
        end,
    },
}
