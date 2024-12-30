return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'zbirenbaum/copilot.lua',
    },
    config = function()
        local cmp = require('cmp')
        local copilot = require('copilot.suggestion')
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then cmp.confirm({ select = true })
                    elseif copilot.is_visible() then copilot.accept()
                    else fallback()
                    end
                end),
                ['<C-k>'] = cmp.mapping(function()
                    if cmp.visible() then cmp.abort()
                    else cmp.complete()
                    end
                end),
                ['<C-n>'] = cmp.mapping(function()
                    if cmp.visible() then cmp.select_next_item()
                    elseif copilot.is_visible() then copilot.next()
                    else cmp.complete()
                    end
                end),
                ['<C-p>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then cmp.select_prev_item()
                    elseif copilot.is_visible() then copilot.prev()
                    else fallback()
                    end
                end),
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }),
        })
    end,
}
