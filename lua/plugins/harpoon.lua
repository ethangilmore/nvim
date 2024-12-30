return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.keymap.set('n', "<Leader>a", require("harpoon.mark").add_file)
        vim.keymap.set('n', "<Leader> ", require("harpoon.ui").toggle_quick_menu)
        vim.keymap.set('n', "<Leader>n", require("harpoon.ui").nav_next)
        vim.keymap.set('n', "<Leader>p", require("harpoon.ui").nav_prev)
        for i = 1, 9 do
            vim.keymap.set('n', "<Leader>" .. i, function()
                require("harpoon.ui").nav_file(i)
            end)
        end
    end,
}

