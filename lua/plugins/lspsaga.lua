return {
    "glepnir/lspsaga.nvim",

    config = function()
        require("lspsaga").setup({
            -- use enter to open file with definition preview
            definition = {
                edit = "<CR>",
            },
            symbol_in_winbar = {
                enable = false,
            },
        })
    end
}
