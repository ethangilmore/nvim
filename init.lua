-- Keymaps
vim.g.mapleader = " "
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<ESC>:w<CR>')
vim.keymap.set('n', '<Leader>X', ':xa<CR>')
-- LSP
vim.keymap.set('n', 'gd', '<cmd>Trouble lsp_definitions<CR>')
vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<CR>')
-- Indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
-- Tabs/Buffers
vim.keymap.set('n', '<Leader>n', ':bnext<CR>')
vim.keymap.set('n', '<Leader>p', ':bprev<CR>')
vim.keymap.set('n', '<Leader>l', ':b#<CR>')
vim.keymap.set('n', '<Leader>d', function()
    local bufnr = vim.fn.bufnr()
    vim.cmd(":bprev")
    vim.cmd(":bdelete " .. bufnr)
end)

-- Basic things
vim.o.number = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "auto:4"
vim.o.cmdheight = 0

-- Filetypes
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cmp",
    command = "setfiletype javascript",
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.cls",
    command = "setfiletype java",
})

-- lazy.nvim things
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

