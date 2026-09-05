return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",

	config = function()
		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			require("config.highlights").apply()
		end)

		require("ibl").setup({
			indent = {
				highlight = "IblIndent",
			},
			scope = {
				enabled = false,
				highlight = "IblScope",
			},
		})
	end,
}
