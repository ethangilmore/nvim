return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<C-/>',
                -- block = '<Leader>b',
            },
            opleader = {
                line = '<C-/>',
                -- block = '<Leader>b',
            },
        })
    end,
}
