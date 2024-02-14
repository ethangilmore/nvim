return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<Leader>/',
                -- block = '<Leader>b',
            },
            opleader = {
                line = '<Leader>/',
                -- block = '<Leader>b',
            },
        })
    end,
}
