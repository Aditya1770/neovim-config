return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local function running_file()
				if vim.g.running_file then
					return "󰑮 " .. vim.g.running_file
				end

				return ""
			end
			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true,
					component_separators = {
						left = "",
						right = "",
					},
				},
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local hooks = require("ibl.hooks")

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IblIndent", {
					fg = "#182326",
				})

				vim.api.nvim_set_hl(0, "IblScope", {
					fg = "#243236",
				})
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
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "thin",
				show_buffer_close_icons = true,
				show_close_icon = false,
			},

			highlights = {
				buffer_selected = {
					bold = false,
					italic = false,
				},

				buffer_visible = {
					bold = false,
					italic = false,
				},

				buffer = {
					bold = false,
					italic = false,
				},
			},
		},
	},
}
