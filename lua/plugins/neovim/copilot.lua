return {
    'zbirenbaum/copilot.lua',
    config = function()
        require('copilot').setup({
            suggestion = {
                auto_trigger = true,
                keymap = {
                    -- accept = "<CR>",
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
        })
    end
}
