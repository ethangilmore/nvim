return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",

    },
    config = function()
        require("nvim-tree").setup({})
        vim.keymap.set('n', '<Leader>tt', function()
            if require'nvim-tree.view'.is_visible() then
                vim.cmd('NvimTreeClose')
            else
                vim.cmd('DiffviewClose')
                vim.cmd('NvimTreeFindFile')
            end
        end);
        vim.keymap.set('n', '<Leader>tf', function() vim.cmd("NvimTreeFocus") end);
    end,
}
