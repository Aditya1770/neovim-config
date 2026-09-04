return {
	{
		"saghen/blink.cmp",
		version = "1.*",

		opts = {
			keymap = {
				preset = "default",

				["<CR>"] = {
					"accept",
					"fallback",
				},

				["<Up>"] = {
					"select_prev",
					"fallback",
				},

				["<Down>"] = {
					"select_next",
					"fallback",
				},
			},

			appearance = {
				kind_icons = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "󰊄",
				},
			},

			completion = {
				menu = {
					border = "single",

					draw = {
						padding = 1,
						gap = 1,

						columns = {
							{
								"label",
								"label_description",
								gap = 1,
							},

							{
								"kind_icon",
								"kind",
								gap = 1,
							},
						},
					},
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 250,

					window = {
						border = "single",
					},
				},
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
			},
		},
	},
}
