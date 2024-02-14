return {
    'sindrets/diffview.nvim',
    config = function()
        require('diffview').setup({
            file_panel = {
                listing_style = "list",
            }
        })
        vim.keymap.set('n', '<leader>tg', function()
        if next(require('diffview.lib').views) == nil then
            vim.cmd('DiffviewOpen')
            require'bufferline.api'.set_offset(36, 'Diffview')
        else
            vim.cmd('DiffviewClose')
            require'bufferline.api'.set_offset(0)
        end
    end)
    end,
}
