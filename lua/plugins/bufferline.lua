return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = function()
		return {
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "thin",
				show_buffer_close_icons = true,
				show_close_icon = false,
				color_icons = true,
				always_show_bufferline = false,
			},
			highlights = require("config.highlights").bufferline(),
		}
	end,
}
