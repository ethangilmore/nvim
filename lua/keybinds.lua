vim.g.mapleader = ' '

vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<ESC>:w<CR>')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)

vim.keymap.set({ 'n' }, '<C-CR>', function ()
    local extension = vim.fn.fnamemodify(vim.fn.expand('%'), ':e')
    local cwd = vim.fn.getcwd()

    if vim.fn.glob(cwd .. "/__main__.py") ~= '' then
        vim.cmd('!python ' .. cwd .. '/__main__.py')
    elseif vim.fn.glob(cwd .. "/[Mm]akefile") ~= '' then
        vim.cmd('make')
    elseif extension == 'py' then
        vim.cmd('!python %')
    elseif extension == 'tex' then
        vim.cmd('!xelatex %')
    elseif extension == 'cpp' then
        vim.cmd('!(g++ % -o %< && ./%<)')
    end
end)

