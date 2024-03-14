-- return {
--   "navarasu/onedark.nvim",
--   lazy = false,
--   priority = 1000,
--   -- opts = {
--   -- 	style = "cool",
--   -- },
--   config = function(_, opts)
--     local onedark = require("onedark")
--     onedark.setup(opts)
--     onedark.load()
--   end,
-- }

return {
	"JoosepAlviste/palenightfall.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("palenightfall").setup()
	end,
}
