return {
	{
		"williamboman/mason.nvim",
		keys = {
			{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
		},

		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },

		opts = {
			ensure_installed = {
				"lua_ls",
				"gopls",
				"pylsp",
				"tsserver",
				"rust_analyzer",
				"terraformls",
				"jsonnet_ls",
				"efm",
				"hls",
			},

			automatic_installation = true,
		},
	},

	-- must be set up before lspconfig
	{
		"folke/neodev.nvim",
		opts = {},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"mattn/efm-langserver",
			"creativenull/efmls-configs-nvim",
		},

		opts = { -- define custom lsp opts here, otherwise, default will be used
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			gopls = {
				filetypes = { "go", "template" },
				settings = {
					gopls = {
						gofumpt = true,
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						semanticTokens = true,
						env = {
							-- add relevant tags to fix lsp
							-- https://github.com/golang/go/issues/29202
							GOFLAGS = "-tags=gen,incremental_test",
						},
					},
				},
			},
			gqls = {
				default_config = {
					cmd = { "gqls" },
					filetypes = { "graphql" },
					root_dir = function(fname)
						return require("lspconfig").util.find_git_ancestor(fname) or vim.loop.os_homedir()
					end,
				},
			},
			gqlt = {
				default_config = {
					cmd = { "gqlt" },
					filetypes = { "gqlt" },
					root_dir = function(fname)
						return require("lspconfig").util.find_git_ancestor(fname) or vim.loop.os_homedir()
					end,
				},
			},
			efm = function()
				local languages = {
					lua = {
						require("efmls-configs.linters.luacheck"),
						require("efmls-configs.formatters.stylua"),
					},
					python = {
						require("efmls-configs.linters.pylint"),
						require("efmls-configs.formatters.autopep8"),
					},
					go = {
						require("efmls-configs.linters.golangci_lint"),
						require("efmls-configs.formatters.goimports"),
						require("efmls-configs.formatters.gofumpt"),
					},
					sql = {
						{ formatCommand = "pg_format -g -", formatStdin = true }, -- https://github.com/darold/pgFormatter
					},
					terraform = {
						require("efmls-configs.formatters.terraform_fmt"),
					},
					yaml = {
						require("efmls-configs.linters.yamllint"),
						-- require("efmls-configs.formatters.yq"),
					},
					haskell = {
						require("efmls-configs.formatters.fourmolu"),
					},
					jsonnet = {
						{ formatCommand = "jsonnetfmt --string-style l -i -", formatStdin = true }, -- https://jsonnet.org/learning/tools.html
					},
				}

				local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
				return {
					filetypes = vim.tbl_keys(languages),
					settings = {
						rootMarkers = { ".git/" },
						languages = languages,
					},
					init_options = {
						documentFormatting = true,
						documentRangeFormatting = true,
					},

					on_attach = function(client, bufnr)
						if client.supports_method("textDocument/formatting") then
							vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
							vim.api.nvim_create_autocmd("BufWritePre", {
								group = augroup,
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.format({ async = false })
								end,
							})
						end
					end,
				}
			end,
		},

		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local lspconfigs = require("lspconfig.configs")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, bufnr)
				local attach_opts = { noremap = true, silent = true, buffer = bufnr }

				local keymap = vim.keymap
				keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.references()<cr>", attach_opts)
				keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", attach_opts)
				keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", attach_opts)
				keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", attach_opts)
				keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", attach_opts)
				keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", attach_opts)
				keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", attach_opts)
				keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", attach_opts)
			end

			local servers = require("mason-lspconfig").get_installed_servers()

			lspconfigs.gqls = opts.gqls
			lspconfigs.gqlt = opts.gqlt
			table.insert(servers, "gqls")
			table.insert(servers, "gqlt")

			for _, server_name in ipairs(servers) do
				local server_opts = {
					capabilities = capabilities,
					on_attach = on_attach,
				}

				if opts[server_name] then
					if type(opts[server_name]) == "function" then
						server_opts = vim.tbl_extend("force", server_opts, opts[server_name]())
					else
						server_opts = vim.tbl_extend("force", server_opts, opts[server_name])
					end
				end

				lspconfig[server_name].setup(server_opts)
			end
		end,
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {
			bind = true,
			handler_opts = {
				border = "single",
			},
			hint_enable = false,
			fix_pos = true,
			padding = " ",
		},
	},

	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter" },
		dependencies = { "L3MON4D3/LuaSnip" },

		config = function()
			local cmp = require("cmp")

			cmp.setup({
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered({ border = "single" }),
					documentation = cmp.config.window.bordered({ border = "single" }),
				},
				mapping = cmp.mapping.preset.insert({
					["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<c-f>"] = cmp.mapping.confirm({ select = true }),
					["<c-space>"] = cmp.mapping.complete(),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "luasnip" },
				},
				formatting = {
					fields = { "kind", "abbr" },
				},
			})
		end,
	},

	-- technically not lsp but related so it can go here
	{
		"nvim-treesitter/nvim-treesitter",

		dependencies = "nushell/tree-sitter-nu",

		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSUpdateSync" },

		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"markdown",
				"markdown_inline",
				"rust",
			},
			auto_install = true,
		},

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.nu = {
				install_info = {
					url = "https://github.com/nushell/tree-sitter-nu",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "nu",
			}
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
}
