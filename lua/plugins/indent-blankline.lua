return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",

	event = { "BufReadPost", "BufNewFile" },

	opts = {
		exclude = { filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" } },
		indent = { char = "|" },
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
			highlight = { "Normal" },
		},
	},
}
