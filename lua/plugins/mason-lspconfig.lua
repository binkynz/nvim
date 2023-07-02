return {
	"williamboman/mason-lspconfig.nvim",

	opts = {
		ensure_installed = {
			"lua_ls",
			"gopls",
			"graphql",
			"pylsp",
			"tsserver",
		},

		automatic_installation = true,
	},
}
