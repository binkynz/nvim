return {
	"williamboman/mason.nvim",

	keys = {
		{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
	},

	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
