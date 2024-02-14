return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<Leader>g', ':G ')
        vim.keymap.set('n', '<Leader>ga', ':G add ')
        vim.keymap.set('n', '<Leader>gc', ':G commit -m ')
        vim.keymap.set('n', '<Leader>gs', function() vim.cmd('G status') end)
    end,
}
