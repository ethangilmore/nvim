return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                theme = 'codedark',
                globalstatus = true,
            },
        })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
