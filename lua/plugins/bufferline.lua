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
                        separator = true -- use a "true" to enable the default, or set your own character
                    },
                    {
                        filetype = "DiffviewFiles",
                        text = "Diffview",
                        highlight = "Directory",
                        separator = true -- use a "true" to enable the default, or set your own character
                    },
                }
            }
        })
    end,
}
