return {
    "kdheepak/lazygit.nvim",
    config = function()
        vim.keymap.set('n', '<Leader>g', function () vim.cmd('LazyGit') end)
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
