return {
	{
		"CRAG666/code_runner.nvim",
		cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype", "CRProjects" },

		keys = {
			{ "<leader>r", "<cmd>update<CR><cmd>RunCode<CR>", desc = "Run code" },
		},

		config = function()
			require("code_runner").setup({
				mode = "term",
				focus = true,
				startinsert = false,

				term = {
					position = "bot",
					size = 12,
				},

				filetype = {
					cpp = {
						"cd $dir &&",
						"g++ $fileName -std=c++17 -O2 -o $fileNameWithoutExt &&",
						"./$fileNameWithoutExt",
					},

					c = {
						"cd $dir &&",
						"gcc $fileName -o $fileNameWithoutExt &&",
						"./$fileNameWithoutExt",
					},

					python = "python $fileName",

					lua = "lua $fileName",

					java = {
						"cd $dir &&",
						"javac $fileName &&",
						"java $fileNameWithoutExt",
					},

					go = "go run $fileName",
				},
			})
		end,
	},
}
