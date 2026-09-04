return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},

		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,

				default_component_configs = {
					indent = {
						indent_size = 2,
						padding = 0,
						with_markers = true,
						with_expanders = false,

						indent_marker = "│",
						last_indent_marker = "└",

						expander_collapsed = "",
						expander_expanded = "",
					},

					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "",
					},

					git_status = {
						symbols = {
							added = "",
							modified = "",
							deleted = "",
							renamed = "",
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},

					name = {
						trailing_slash = false,
						use_git_status_colors = true,
					},
				},

				filesystem = {
					follow_current_file = {
						enabled = true,
					},

					filtered_items = {
						visible = false,
						hide_dotfiles = true,
						hide_gitignored = false,
					},
				},

				window = {
					width = 30,
				},
			})

			local bg = "#0A1114"

			vim.api.nvim_set_hl(0, "NeoTreeNormal", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeRootName", {
				fg = "#8c9fa3",
				bg = bg,
				bold = false,
				italic = false,
			})

			vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", {
				fg = "#719fdd",
				bold = false,
				italic = false,
			})

			vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", {
				fg = "#719fdd",
			})

			vim.api.nvim_set_hl(0, "NeoTreeFileName", {
				fg = "#c8d1d3",
				bold = false,
				italic = false,
			})

			vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", {
				fg = "#c8d1d3",
				bold = false,
				italic = false,
			})

			vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", {
				fg = "#263438",
			})

			vim.api.nvim_set_hl(0, "NeoTreeExpander", {
				fg = "#61777d",
			})

			vim.api.nvim_set_hl(0, "NeoTreeCursorLine", {
				bg = "#141b1e",
			})

			vim.api.nvim_set_hl(0, "NeoTreeDimText", {
				fg = "#4b595d",
				italic = true,
			})

			vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
			vim.keymap.set("n", "<leader>e", "<cmd>Neotree focus<CR>", { desc = "Focus file explorer" })
		end,
	},
}
