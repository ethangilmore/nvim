vim.keymap.set('n', '<Leader>ff', ":Telescope find_files<CR>")
vim.keymap.set('n', '<Leader>fg', ":Telescope git_files<CR>")
vim.keymap.set('n', '<Leader>fb', ":Telescope buffers<CR>")
vim.keymap.set('n', '<Leader>fw', ":Telescope live_grep<CR>")

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
}
