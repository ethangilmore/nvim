return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "lua", "c", "cpp", "c_sharp", "java", "python", "javascript", "typescript", "html", "css", "latex", "bibtex" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end
}

