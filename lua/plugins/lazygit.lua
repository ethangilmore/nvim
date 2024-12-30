vim.keymap.set('n', "<Leader>gg", function () vim.cmd("LazyGit") end)

return {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = "LazyGit",
}

