return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function(_, opts)
		local vscode = require("vscode")
		vscode.setup(opts)
		vscode.load()
	end,
}
