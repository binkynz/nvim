return {
	"williamboman/mason-lspconfig.nvim",

	opts = {
		ensure_installed = {
			"lua_ls",
			"gopls",
			"graphql",
			"pylsp",
			"tsserver",
			"rust_analyzer",
		},

		automatic_installation = true,
	},
}
