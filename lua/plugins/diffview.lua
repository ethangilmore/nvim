return {
    'sindrets/diffview.nvim',
    config = function()
        require('diffview').setup({
            file_panel = {
                listing_style = "list",
            }
        })
    end,
}
