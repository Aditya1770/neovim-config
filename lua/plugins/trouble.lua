return {
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			auto_preview = true,
            multiline = true,

			modes = {
				diagnostics = {
					win = {
						type = "split",
						position = "right",
						size = 0.4,
					},
				},
			},
		},

		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<CR>",
				desc = "Diagnostics",
			},
			{
				"<leader>xd",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				desc = "Buffer diagnostics",
			},
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<CR>",
				desc = "Quickfix",
			},
		},
	},
}
