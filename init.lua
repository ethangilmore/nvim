-- Keybinds
require("keybinds.shared")
if vim.g.vscode then
    require("keybinds.vscode")
else
    require("keybinds.neovim")
end

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    { import = "plugins.shared" },
	{ import = "plugins.neovim", cond = (function() return not vim.g.vscode end) },
	-- { import = "plugins.vscode", cond = (function() return vim.g.vscode end) },
})
