-- return {
-- 	"navarasu/onedark.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	-- opts = {
-- 	-- 	style = "cool",
-- 	-- },
-- 	config = function(_, opts)
-- 		local onedark = require("onedark")
-- 		onedark.setup(opts)
-- 		onedark.load()
-- 	end,
-- }

-- has no highlighting setup for gqlt
return {
	"JoosepAlviste/palenightfall.nvim",
	lazy = false,
	priority = 1000,

	-- so grab a backup scheme
	dependencies = { "navarasu/onedark.nvim", "NTBBloodbath/doom-one.nvim" },

	config = function()
		require("palenightfall").setup()
	end,
}
