return {
	"kevinhwang91/nvim-bqf",

	event = { "BufReadPost", "BufNewFile" },

	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	},

	opts = {
		auto_resize_height = true,
		preview = {
			win_height = 25,
			win_vheight = 25,
			border = "single",
		},
	},
}
