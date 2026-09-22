local palette = require("config.palette")
local colors = {
	bg = palette.panel,
	section = palette.section,
	fg = palette.soft_fg,
	muted = "#8c9fa3",
	blue = palette.accent,
	green = palette.green,
	purple = palette.purple,
	red = palette.red,
	yellow = palette.yellow,
}

local theme = {
	normal = {
		a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
		b = { fg = colors.fg, bg = colors.section },
		c = { fg = colors.muted, bg = colors.bg },
	},
	insert = {
		a = { fg = colors.bg, bg = colors.green, gui = "bold" },
	},
	visual = {
		a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
	},
	replace = {
		a = { fg = colors.bg, bg = colors.red, gui = "bold" },
	},
	command = {
		a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
	},
	inactive = {
		a = { fg = colors.muted, bg = colors.bg },
		b = { fg = colors.muted, bg = colors.bg },
		c = { fg = colors.muted, bg = colors.bg },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local function lsp_name()
			local clients = vim.lsp.get_clients({ bufnr = 0 })

			if #clients == 0 then
				return "󰒋 No LSP"
			end

			return "󰒋 " .. clients[1].name
		end

		require("lualine").setup({
			options = {
				theme = theme,
				globalstatus = true,
				component_separators = "",
				-- Slanted Powerline separators: \ instead of the rounded ) shape.
				section_separators = {
					left = "",
					right = "",
				},
			},

			sections = {
				lualine_a = {
					{
						"mode",
						fmt = string.upper,
					},
				},

				lualine_b = {
					{
						"filetype",
						icon_only = true,
						colored = true,
						padding = { left = 1, right = 0 },
					},
					{
						"filename",
						path = 0,
						padding = { left = 1, right = 1 },
					},
					{
						"branch",
						icon = "",
					},
				},

				lualine_c = {},
				lualine_x = {
					{
						lsp_name,
						color = { fg = colors.muted, bg = colors.section },
					},
				},
				lualine_y = {},
				lualine_z = {
					{
						"location",
						color = { fg = colors.bg, bg = colors.blue, gui = "bold" },
					},
				},
			},

			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
