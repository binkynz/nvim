return {
    "lukas-reineke/indent-blankline.nvim",

    event = { "BufReadPost", "BufNewFile" },

    config = function()
        require("indent_blankline").setup({
            char = "|",
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        })
    end
}
