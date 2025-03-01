vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    float = {
        border = "rounded",
        scope = "cursor",
        focusable = false,
        source = false,
    },
})

vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function ()
        vim.diagnostic.open_float(nil, {
        close_events = {
            "CursorMoved",
            "CursorMovedI",
            "BufHidden",
            "InsertCharPre",
            "WinLeave",
        },
        })
    end,
})

vim.o.updatetime = 250
