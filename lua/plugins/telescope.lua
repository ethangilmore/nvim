vim.keymap.set('n', '<Leader>ff', ":Telescope find_files<CR>")
vim.keymap.set('n', '<Leader>fg', ":Telescope git_files<CR>")
vim.keymap.set('n', '<Leader>fb', ":Telescope buffers<CR>")
vim.keymap.set('n', '<Leader>fw', ":Telescope live_grep<CR>")

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    opts = {
        defaults = {
            initial_mode = "normal",
        },
    },
    cmd = "Telescope",
}

