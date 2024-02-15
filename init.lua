-- Keymaps
vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>sr', ':%s/')
vim.keymap.set('n', '<Leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<Leader>bp', ':bprev<CR>')
vim.keymap.set('n', '<Leader>bd', function()
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

