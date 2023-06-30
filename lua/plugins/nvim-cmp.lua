return {
	"hrsh7th/nvim-cmp",

	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},

	config = function()
		local cmp = require("cmp")

		local icons = {
			Text = "text",
			Method = "method",
			Function = "fn",
			Constructor = "ctor",
			Field = "field",
			Variable = "var",
			Class = "class",
			Interface = "iface",
			Module = "module",
			Property = "property",
			Unit = "unit",
			Value = "val",
			Enum = "enum",
			Keyword = "keyword",
			Snippet = "snippet",
			Color = "color",
			File = "file",
			Reference = "ref",
			Folder = "folder",
			EnumMember = "enum-member",
			Constant = "const",
			Struct = "struct",
			Event = "event",
			Operator = "operator",
			TypeParameter = "type-parameter",
			Copilot = "copilot",
		}

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
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-f>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "luasnip" },
			},
			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			formatting = {
				fields = { "kind", "abbr" },
				format = function(_, vim_item)
					vim_item.kind = "[" .. (icons[vim_item.kind] or "") .. "]"

					return vim_item
				end,
			},
		})
	end,
}
