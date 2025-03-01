vim.keymap.set("n", "-", "<CMD>Oil<CR>")

return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, bufnr)
                return name:match("^%.%.$") or name:match("^%.git$")
            end,
        },
        keymaps = {
            ["<C-s>"] = false,
        },
    },
}

