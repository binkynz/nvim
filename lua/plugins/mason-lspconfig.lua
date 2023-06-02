return {
    "williamboman/mason-lspconfig.nvim",

    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "graphql",
                "pylsp",
            },

            automatic_installation = true,
        })
    end,
}
