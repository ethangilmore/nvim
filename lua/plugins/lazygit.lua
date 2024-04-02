return {
    "kdheepak/lazygit.nvim",
    config = function()
        vim.keymap.set('n', '<Leader>gg', function () vim.cmd('LazyGit') end)
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
