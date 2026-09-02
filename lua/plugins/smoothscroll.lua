return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,

		opts = {
			scroll = {
				animate = {
					duration = {
						step = 5,
						total = 60,
					},
					easing = "linear",
				},

				animate_repeat = {
					delay = 50,
					duration = {
						step = 3,
						total = 30,
					},
					easing = "linear",
				},
			},
		},
	},
}
