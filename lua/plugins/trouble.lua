vim.keymap.set('n', 'gd', '<cmd>Trouble lsp_definitions<CR>')
vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<CR>')

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        mode = "document_diagnostics",
        padding = false,
        auto_close = true,
        -- use_diagnostic_signs = true,
    },
    init = function()
        vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
        vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
        vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
        vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
    end,
}
