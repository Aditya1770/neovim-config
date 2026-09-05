return {
	"NightCS/night.nvim",
	name = "night",
	lazy = false,
	priority = 1000,

	config = function()
		require("night").setup({
			nvim_tree = {
				contrast = true,
			},
		})

		vim.cmd.colorscheme("night")
		require("config.highlights").setup()
	end,
}
