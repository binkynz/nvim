return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "stevearc/aerial.nvim", opts = {} },
	},

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files in current working directory" },
		{
			"<leader>fs",
			"<cmd>Telescope live_grep<cr>",
			desc = "Find string in current working directory",
		},
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "List help tags" },
		{ "<leader>fd", "<cmd>Telescope aerial<cr>", desc = "Aerial document symbols" },
		{ "<leader>dd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
	},

	opts = {
		pickers = {
			["find_files"] = {
				theme = "ivy",
				layout_config = { height = 0.5 },
			},
		},
		extensions = {
			["file_browser"] = {
				theme = "ivy",
				layout_config = { height = 0.5 },
			},
			["ui-select"] = {
				function()
					require("telescope.themes").get_cursor()
				end,
			},
		},
	},

	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		-- telescope.load_extension("fzf")
		telescope.load_extension("aerial")
	end,
}
