return {
    "williamboman/mason.nvim",

    keys = {
        { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },

    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
    end,
}
