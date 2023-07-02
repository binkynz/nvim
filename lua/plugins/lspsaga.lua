return {
	"glepnir/lspsaga.nvim",

	event = { "BufReadPre", "BufNewFile" },

	opts = {
		-- use enter to open file with definition preview
		definition = {
			edit = "<CR>",
		},
		symbol_in_winbar = {
			enable = false,
		},
		lightbulb = {
			enable = false,
		},
	},
}
