return  {
    'akinsho/bufferline.nvim',
    config = function()
        require('bufferline').setup({
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = "▕",
                    },
                    {
                        filetype = "DiffviewFiles",
                        text = "Diffview",
                        highlight = "Directory",
                        separator = "▕",
                    },
                }
            }
        })
        vim.cmd("highlight BufferLineOffsetSeparator guibg=#1F1F28")
        vim.cmd("set fillchars+=vert:▕")
    end,
}
