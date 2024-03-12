-- Keymaps
vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>;', '@:')
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<ESC>:w<CR>')
vim.keymap.set('n', '<Leader>q', ':qa<CR>')
vim.keymap.set('n', '<Leader>x', ':xa<CR>')
vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')
vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('n', '<Leader>sr', ':%s/')
vim.keymap.set('n', '<Leader>w', '<C-w>')
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
vim.o.signcolumn = "yes:1"
vim.o.cmdheight = 0

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

