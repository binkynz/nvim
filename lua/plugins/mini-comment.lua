return {
	"echasnovski/mini.comment",

	event = "VeryLazy",

	opts = {
		mappings = {
			-- toggle comment (like `gcip` - comment inner paragraph) for both
			-- normal and Visual modes
			comment = "gc",

			-- toggle comment on current line
			comment_line = "gcc",

			-- define 'comment' textobject (like `dgc` - delete whole comment block)
			textobject = "gc",
		},
	},
}
