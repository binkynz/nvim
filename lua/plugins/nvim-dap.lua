return {
	"mfussenegger/nvim-dap",

	dependencies = {
		{
			"theHamsta/nvim-dap-virtual-text",
			-- lazy = false,
			opts = {},
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = "mason.nvim",
			cmd = { "DapInstall", "DapUninstall" },
			opts = {
				automatic_installation = true,
				ensure_installed = {
					"delve",
				},
			},
		},
		{
			"leoluz/nvim-dap-go",
			keys = {
				{
					"<leader>dt",
					function()
						require("dap-go").debug_test()
					end,
					desc = "Debug test",
				},
				{
					"<leader>dtl",
					function()
						require("dap-go").debug_last_test()
					end,
					desc = "Debug last test",
				},
			},
			config = function()
				require("dap-go").setup({
					delve = {
						initialize_timeout_sec = 20,
						port = "${port}",
					},
				})
			end,
		},
	},

	keys = {
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Continue",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle breakpoint",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
			desc = "Open REPL",
		},
		{
			"<leader>ds",
			function()
				require("dap").step_over()
			end,
			desc = "Step over",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Step into",
		},
		{
			"<leader>do",
			function()
				require("dap").step_out()
			end,
			desc = "Step out",
		},
	},
}
