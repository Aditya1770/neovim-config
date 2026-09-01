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

						indent_marker = "│",
						last_indent_marker = "└",

						expander_collapsed = "",
						expander_expanded = "",
					},

					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "",
					},

					name = {
						trailing_slash = false,
						use_git_status_colors = false,
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
            
			vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
			vim.keymap.set("n", "<leader>e", "<cmd>Neotree focus<CR>", { desc = "Focus file explorer" })
		end,
	},
}
