return {
	"nvim-telescope/telescope.nvim",

	event = "BufReadPre",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-file-browser.nvim",
		{ "stevearc/aerial.nvim", opts = {} },
	},

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files in current working directory" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in current working directory" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "List help tags" },
		{ "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File Browser" }, -- https://github.com/nvim-telescope/telescope-file-browser.nvim#mappings
		{ "<leader>fd", "<cmd>Telescope aerial<cr>", desc = "Aerial document symbols" },
	},

	opts = {},

	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		telescope.load_extension("aerial")
	end,
}
