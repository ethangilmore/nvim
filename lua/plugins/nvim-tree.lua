return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",

    },
    config = function()
        require("nvim-tree").setup({})
        local toggle_tree = function()
            if require'nvim-tree.view'.is_visible() then
                require'nvim-tree.api'.tree.close()
                require'bufferline.api'.set_offset(0)
            else
                require'bufferline.api'.set_offset(31, 'File Explorer')
                require'nvim-tree.api'.tree.open()
            end
        end
        vim.keymap.set('n', '<Leader>tt', toggle_tree)
    end,
}
