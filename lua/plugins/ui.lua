return {

	{
		"Everblush/nvim",
		name = "everblush",
		priority = 1000,

		config = function()
			require("everblush").setup({
				transparent_background = false,

				nvim_tree = {
					contrast = true,
				},
			})

			vim.cmd("colorscheme everblush")

			local bg = "#0A1114"
			local separator = "#1c2529"

			vim.api.nvim_set_hl(0, "LineNr", {
				fg = "#263438",
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "LineNrAbove", {
				fg = "#2b3438",
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "LineNrBelow", {
				fg = "#2b3438",
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "CursorLine", {
				bg = "#141b1e",
			})

			vim.api.nvim_set_hl(0, "CursorLineNr", {
				fg = "#6c7a7d",
				bg = bg,
				bold = true,
			})

			vim.api.nvim_set_hl(0, "SignColumn", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "FoldColumn", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "Normal", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NormalNC", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "SignColumn", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "EndOfBuffer", {
				fg = bg,
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "WinSeparator", {
				fg = separator,
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "VertSplit", {
				fg = separator,
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeNormal", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", {
				fg = bg,
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", {
				fg = separator,
				bg = bg,
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true,
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
		},
	},
}
