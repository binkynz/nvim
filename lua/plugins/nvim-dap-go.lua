return {
    "leoluz/nvim-dap-go",

    dependencies = "mfussenegger/nvim-dap",
    keys = {
        { "<leader>dt",  function() require("dap-go").debug_test() end,      desc = "Debug test" },
        { "<leader>dtl", function() require("dap-go").debug_last_test() end, desc = "Debug last test" },
    },

    config = function()
        require('dap-go').setup({
            dap_configurations = {
                {
                    type = "go",
                    name = "Attach remote",
                    mode = "remote",
                    request = "attach",
                },
            },
            delve = {
                initialize_timeout_sec = 20,
                port = "${port}",
            },
        })
    end
}
