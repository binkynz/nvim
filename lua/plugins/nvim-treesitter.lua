return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },

    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            autotag = { enable = true },
            ensure_installed = {
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "markdown",
                "markdown_inline",
            },
            auto_install = true,
        })
    end
}
