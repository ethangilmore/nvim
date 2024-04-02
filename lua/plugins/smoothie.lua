return {
    'psliwka/vim-smoothie',
    init = function()
        vim.keymap.set({ 'n', 'i' , 'v'}, '<C-j>', '<Plug>(SmoothieDownwards)')
        vim.keymap.set({ 'n', 'i', 'v'}, '<C-k>', '<Plug>(SmoothieUpwards)')
    end,
}
