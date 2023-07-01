return {
	"nvim-lualine/lualine.nvim",

	event = "VeryLazy",
	dependencies = {
		"SmiteshP/nvim-navic",
	},

	config = function()
		local lualine = require("lualine")

		local lspname = function()
			local msg = "no-active-lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
			return msg
		end

		lualine.setup({
			options = {
				theme = "auto",
				section_separators = "",
				component_separators = "",
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
					"navic",
				},
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					lspname,
					{
						function()
							return "copilot" .. (require("copilot.api").status.data.message or "")
						end,
						cond = function()
							local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
							return ok and #clients > 0
						end,
					},
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
