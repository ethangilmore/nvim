return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<Leader>c',
                block = '<Leader>b',
            },
            opleader = {
                line = '<Leader>c',
                block = '<Leader>b',
            },
        })
    end,
}
