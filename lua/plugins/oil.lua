return {
	"stevearc/oil.nvim",

	keys = {
		{
			"-",
			function()
				require("oil").open()
			end,
			desc = "Open parent directory",
		},
		{
			"+",
			function()
				require("oil").close()
			end,
			desc = "Restore previous buffer",
		},
	},

	opts = {
		columns = {},
		view_options = { show_hidden = true },
	},
}
