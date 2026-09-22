return {
	{
		"CRAG666/code_runner.nvim",
		cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype", "CRProjects" },

		keys = {
			{
				"<leader>r",
				function()
					vim.cmd.update()

					local extension = vim.fn.expand("%:e")
					if vim.bo.filetype == "gomod" or extension == "mod" then
						vim.notify(
							"This is a Go module file. Save executable code as a .go file (for example main.go).",
							vim.log.levels.ERROR,
							{ title = "Code runner" }
						)
						return
					end

					vim.cmd.RunFile()
				end,
				desc = "Run current file",
			},
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
						'cd "$dir" &&',
						'g++ "$fileName" -std=c++17 -O2 -Wall -Wextra -o "$fileNameWithoutExt" &&',
						'./"$fileNameWithoutExt"',
					},

					c = {
						'cd "$dir" &&',
						'gcc "$fileName" -Wall -Wextra -o "$fileNameWithoutExt" &&',
						'./"$fileNameWithoutExt"',
					},

					python = 'cd "$dir" && python "$fileName"',

					lua = 'cd "$dir" && lua "$fileName"',

					java = {
						'cd "$dir" &&',
						'javac "$fileName" &&',
						'java "$fileNameWithoutExt"',
					},

					go = 'cd "$dir" && go run "$fileName"',
				},
			})
		end,
	},
}
