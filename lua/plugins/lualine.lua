return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts =  {
        options = {
            component_separators = '',
            section_separators = '',
            -- section_separators = { left = '', right = '' },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { { 'mode', separator = {--[[  left = ''  ]]}, right_padding = 2 } },
            lualine_b = { 'filename' },
            lualine_c = { 'branch', 'diff' },
            lualine_x = { 'diagnostics' },
            lualine_y = { 'filetype', 'progress' },
            lualine_z = { { 'location', separator = {--[[  right = ''  ]]}, left_padding = 2 } },
        },
        inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
    },
}

