return {
	"lewis6991/gitsigns.nvim",

	event = { "BufReadPre", "BufNewFile" },

	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "right_align",
			delay = 500,
			ignore_whitespace = false,
		},
	},
}
