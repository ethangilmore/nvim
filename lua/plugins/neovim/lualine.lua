return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local colors = require('kanagawa.colors').setup()
        local palette = colors.palette
        require('lualine').setup({
            options = {
                globalstatus = true,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                theme = {
                    normal = {
                        a = { bg = palette.crystalBlue, fg = palette.sumiInk1 },
                        b = { bg = palette.sumiInk1, fg = palette.crystalBlue },
                        c = { bg = palette.sumiInk1, fg = palette.sumiInk2 },
                    },
                    insert = {
                        a = { bg = palette.springGreen, fg = palette.sumiInk1 },
                        b = { bg = palette.sumiInk1, fg = palette.springGreen },
                        c = { bg = palette.sumiInk1, fg = palette.sumiInk2 },
                    },
                    visual = {
                        a = { bg = palette.oniViolet, fg = palette.sumiInk1 },
                        b = { bg = palette.sumiInk1, fg = palette.oniViolet },
                        c = { bg = palette.sumiInk1, fg = palette.sumiInk2 },
                    },
                    replace = {
                        a = { bg = palette.peachRed, fg = palette.sumiInk1 },
                        b = { bg = palette.sumiInk1, fg = palette.peachRed },
                        c = { bg = palette.sumiInk1, fg = palette.sumiInk2 },
                    },
                    command = {
                        a = { bg = palette.roninYellow, fg = palette.sumiInk1 },
                        b = { bg = palette.sumiInk1, fg = palette.roninYellow },
                        c = { bg = palette.sumiInk1, fg = palette.sumiInk2 },
                    },
                },
            },
        })
    end,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "rebelot/kanagawa.nvim",
    }
}
