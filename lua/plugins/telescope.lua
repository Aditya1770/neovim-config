return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{ "<leader>sf", desc = "Find files" },
			{ "<leader>sg", desc = "Search text" },
			{ "<leader>sb", desc = "Search buffers" },
			{ "<leader>sh", desc = "Search help" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>sf", builtin.find_files, {
				desc = "Find files",
			})

			vim.keymap.set("n", "<leader>sg", builtin.live_grep, {
				desc = "Search text",
			})

			vim.keymap.set("n", "<leader>sb", builtin.buffers, {
				desc = "Search buffers",
			})

			vim.keymap.set("n", "<leader>sh", builtin.help_tags, {
				desc = "Search help",
			})
		end,
	},
}
