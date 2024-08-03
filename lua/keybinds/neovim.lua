-- Keymaps
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<ESC>:w<CR>')
vim.keymap.set('n', '<Leader>X', ':xa<CR>')
-- LSP
vim.keymap.set('n', 'gd', '<cmd>Trouble lsp_definitions<CR>')
vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<CR>')
-- Tabs/Buffers
vim.keymap.set('n', '<Leader>n', ':bnext<CR>')
vim.keymap.set('n', '<Leader>p', ':bprev<CR>')
vim.keymap.set('n', '<Leader>l', ':b#<CR>')
vim.keymap.set('n', '<Leader>d', function()
    local bufnr = vim.fn.bufnr()
    vim.cmd(":bprev")
    vim.cmd(":bdelete " .. bufnr)
end)
vim.keymap.set('n', '<Leader>o', function()
    local current_buf = vim.api.nvim_get_current_buf()
    print("Current buffer number: " .. current_buf)
    assert(current_buf ~= nil and current_buf > 0, "Invalid buffer number")
end)
vim.keymap.set('n', '<Leader><CR>', '@:')

-- Basic things
vim.o.number = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.cmdheight = 0
vim.o.relativenumber = true
vim.o.number = true

-- Filetypes
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cmp",
    command = "setfiletype javascript",
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cls",
    command = "setfiletype java",
})

