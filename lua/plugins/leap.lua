return {
	{
		"ggandor/leap.nvim",
		lazy = false,
		dependencies = "tpope/vim-repeat",
		config = function()
			require("leap").add_default_mappings()

			vim.cmd("highlight clear IncSearch")
			vim.cmd("highlight clear Search")
			vim.cmd("highlight link IncSearch LeapLabelPrimary")
			vim.cmd("highlight link Search LeapLabelPrimary")
		end,
	},
	{
		"ggandor/flit.nvim",
		lazy = false,
		dependencies = "ggandor/leap.nvim",
		opts = {},
	},
}
