return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            filters = {
                custom  = {
                    ".meta",
                },
            },
        })
        vim.keymap.set('n', '<Leader>tt', function() vim.cmd('NvimTreeToggle') end);
        vim.keymap.set('n', '<Leader>tf', function() vim.cmd("NvimTreeFocus") end);
    end,
}
