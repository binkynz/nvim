return {
	"williamboman/mason-lspconfig.nvim",

	opts = {
		ensure_installed = {
			"lua_ls",
			"gopls",
			"graphql",
			"pylsp",
		},

		automatic_installation = true,
	},
}
