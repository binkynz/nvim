return {
	"kdheepak/lazygit.nvim",

	events = "VeryLazy",

	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
	},
}
