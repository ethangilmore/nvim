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
                vim.cmd('NvimTreeClose')
                vim.cmd('DiffviewOpen')
            else
                vim.cmd('DiffviewClose')
            end
        end)
    end,
}
