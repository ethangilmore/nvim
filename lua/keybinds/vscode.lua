local vscode = require('vscode-neovim')
vim.keymap.set('n', '<Leader>n', ':Tabnext<CR>')
vim.keymap.set('n', '<Leader>p', ':Tabprev<CR>')
vim.keymap.set('n', '<Leader>d', ':Tabclose<CR>')
