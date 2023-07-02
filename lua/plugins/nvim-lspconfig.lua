return {
	"neovim/nvim-lspconfig",

	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{
			"SmiteshP/nvim-navbuddy",
			dependencies = {
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim",
			},
		},
		{
			"someone-stole-my-name/yaml-companion.nvim",
			requires = {
				{ "neovim/nvim-lspconfig" },
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope.nvim" },
			},
			keys = {
				{ "<leader>z", "<cmd>Telescope yaml_schema<cr>", desc = "Set the yaml schema" },
			},
			config = function()
				require("telescope").load_extension("yaml_schema")
			end,
		},
	},

	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(client, bufnr)
			local keymap = vim.keymap

			-- keybind options
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- set keybinds
			keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
			keymap.set("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
			keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
			keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
			keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts) -- see type definition
			keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- see available code actions
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
			keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
			keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
			keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
			keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
			keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

			if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
				local semantic = client.config.capabilities.textDocument.semanticTokens
				client.server_capabilities.semanticTokensProvider = {
					full = true,
					legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
					range = true,
				}
			end
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- change diagnostic symbols in gutter
		local signs = { Error = "e", Warn = "w", Hint = "h", Info = "i" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				gopls = {
					gofumpt = true,
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					semanticTokens = true,
				},
			},
		})

		lspconfig.graphql.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.pylsp.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.yamlls.setup(require("yaml-companion").setup({}))
	end,
}
