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
                mapping = cmp.mapping.preset.insert({
                    ['<C-k>'] = cmp.mapping(function()
                        if not require('copilot.suggestion').is_visible() then
                            cmp.close()
                        else
                            cmp.complete()
                        end
                    end),
                    ['<C-n>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif require('copilot.suggestion').is_visible() then
                            require('copilot.suggestion').next()
                        else
                            fallback()
                        end
                    end),
                    ['<C-p>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif require('copilot.suggestion').is_visible() then
                            require('copilot.suggestion').prev()
                        else
                            fallback()
                        end
                    end),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                        elseif require('copilot.suggestion').is_visible() then
                            local current_buf = vim.api.nvim_get_current_buf()
                            print("Current buffer number: " .. current_buf)
                            require('copilot.suggestion').accept()
                        else
                            fallback()
                        end
                    end),
                })
            })

            cmp.event:on("menu_opened", function()
                require('copilot.suggestion').dismiss()
            end)

            cmp.event:on("menu_closed", function()
                require('copilot.suggestion').next()
            end)
        end,
    },
}
