return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    opts = {},

    config = function(_, opts)
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc", "javascript", "c", "lua", "rust", "bash", "cpp", "toml", "html", "css", "python"
            },

            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = false
            }
        })
    end
}
