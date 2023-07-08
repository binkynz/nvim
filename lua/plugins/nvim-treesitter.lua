return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync" },

	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		autotag = { enable = true },
		ensure_installed = {
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"go",
			"gomod",
			"gowork",
			"gosum",
			"markdown",
			"markdown_inline",
			"rust",
		},
		auto_install = true,
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
