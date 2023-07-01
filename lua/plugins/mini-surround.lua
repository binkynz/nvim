return {
	"echasnovski/mini.surround",

	event = "VeryLazy",

	opts = {
		mappings = {
			add = "sa", -- add surrounding in Normal and Visual modes
			delete = "sd", -- delete surrounding
			find = "sf", -- find surrounding (to the right)
			find_left = "sF", -- find surrounding (to the left)
			highlight = "sh", -- highlight surrounding
			replace = "sr", -- replace surrounding
			update_n_lines = "sn", -- update `n_lines`

			suffix_last = "l", -- suffix to search with "prev" method
			suffix_next = "n", -- suffix to search with "next" method
		},
	},
}
