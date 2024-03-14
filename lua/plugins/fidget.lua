return {
	"j-hui/fidget.nvim",
	tag = "legacy",
	event = "LspAttach",
	opts = {
		fmt = {
			task = function(task_name, message, percentage)
				return string.lower(
					string.format(
						"%s%s [%s]",
						message,
						percentage and string.format(" (%s%%)", percentage) or "",
						task_name
					)
				)
			end,
		},
	},
}
