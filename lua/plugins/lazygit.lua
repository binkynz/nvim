return {
	"kdheepak/lazygit.nvim",

	lazy = false,

	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
	},
}
