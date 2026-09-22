return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",

		opts = {
			keymap = {
				preset = "default",

				["<CR>"] = {
					"accept",
					"fallback",
				},

				["<Tab>"] = {
					"select_next",
					"fallback",
				},

				["<S-Tab>"] = {
					"select_prev",
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
					min_width = 28,
					max_height = 12,
					scrollbar = false,
					winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None,CurSearch:None",

					draw = {
						padding = { 1, 1 },
						gap = 1,
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind", gap = 1 },
						},
					},
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 300,

					window = {
						border = "single",
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
					},
				},
			},

			signature = {
				enabled = true,
				window = {
					border = "single",
					winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
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
