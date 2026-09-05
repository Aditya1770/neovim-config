return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = function()
		return {
			options = {
				theme = require("config.highlights").lualine_theme(),
				globalstatus = true,
				component_separators = {
					left = "",
					right = "",
				},
			},
		}
	end,
}
