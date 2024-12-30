vim.keymap.set("n", "-", "<CMD>Oil<CR>")

return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        keymaps = {
            ["<C-s>"] = false,
        },
    },
}

