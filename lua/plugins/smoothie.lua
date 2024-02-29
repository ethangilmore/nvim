return {
    'psliwka/vim-smoothie',
    init = function()
        vim.keymap.set({ 'n', 'i' }, '<C-j>', '<Plug>(SmoothieDownwards)')
        vim.keymap.set({ 'n', 'i' }, '<C-k>', '<Plug>(SmoothieUpwards)')
    end,
}
