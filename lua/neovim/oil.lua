vim.keymap.set("n", "-", "<CMD>Oil<CR>")

return {
    'stevearc/oil.nvim',
    opts = {
        keymaps = {
            ["<C-s>"] = false,
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
