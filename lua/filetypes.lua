vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cmp",
    command = "setfiletype javascript",
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cls",
    command = "setfiletype java",
})

