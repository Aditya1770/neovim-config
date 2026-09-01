return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.setup({})

			wk.add({
				{ "<leader>s", group = "Search" },
				{ "<leader>r", group = "Run" },
				{ "<leader>c", group = "Code" },
			})
		end,
	},
}
