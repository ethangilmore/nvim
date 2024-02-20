return {
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
                    completeopt = 'menu,menuone,noinsert'
                },
                mapping = cmp.mapping.preset.insert({
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
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if vim.b.copilot_suggestion_hidden then
                            fallback()
                        else
                            require('copilot.suggestion').accept()
                        end
                    end),
                })
            })
        end,
    },
}
