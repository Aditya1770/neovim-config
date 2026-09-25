local function setup_bufferline()
	require("bufferline").setup({
		options = {
			diagnostics = "nvim_lsp",
			separator_style = "thin",
			show_buffer_close_icons = true,
			show_close_icon = false,
			color_icons = true,
			always_show_bufferline = false,
		},
		highlights = require("config.highlights").bufferline(),
	})
	vim.schedule(require("config.highlights").apply_bufferline)
end

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		setup_bufferline()
		vim.api.nvim_create_autocmd("User", {
			pattern = "FianchettoThemeChanged",
			group = vim.api.nvim_create_augroup("fianchetto_bufferline", { clear = true }),
			callback = setup_bufferline,
		})
	end,
}
