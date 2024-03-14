return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",

	opts = {
		options = {
			theme = "auto",
			component_separators = "|",
			section_separators = "",
			globalstatus = true,
			fmt = string.lower,
			icons_enabled = false,
		},

		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{
					"filename",
					path = 1, -- relative path
				},
			},
			lualine_x = {
				"encoding",
				"fileformat",
				"filetype",
				function()
					local ok, clients = pcall(vim.lsp.get_active_clients)
					if not ok then
						return ""
					end

					local active_clients = {}
					local filetype = vim.api.nvim_get_option_value("filetype", { buf = 0 })
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, filetype) ~= -1 then
							table.insert(active_clients, client.name)
						end
					end

					return table.concat(active_clients, " ")
				end,
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
