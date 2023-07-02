return {
	"nvim-telescope/telescope.nvim",

	event = "BufReadPre",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-file-browser.nvim",
		{ "stevearc/aerial.nvim", opts = {} },
		"nvim-telescope/telescope-ui-select.nvim",
	},

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find files in current working directory" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in current working directory" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "List help tags" },
		{ "<leader>fb", "<cmd>Telescope file_browser hidden=true<cr>", desc = "File Browser" }, -- https://github.com/nvim-telescope/telescope-file-browser.nvim#mappings
		{ "<leader>fd", "<cmd>Telescope aerial<cr>", desc = "Aerial document symbols" },
		{ "<leader>dd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
	},

	opts = {
		pickers = {
			["find_files"] = {
				theme = "ivy",
			},
		},
		extensions = {
			["file_browser"] = {
				theme = "ivy",
			},
		},
	},

	config = function(_, opts)
		local telescope = require("telescope")
		-- has to be set this way for ui-select unfortunately
		opts.extensions["ui-select"] = {
			require("telescope.themes").get_cursor({}),
		}
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		telescope.load_extension("aerial")
		telescope.load_extension("ui-select")
	end,
}
