return {
	{
		"xeluxee/competitest.nvim",

		dependencies = {
			"MunifTanjim/nui.nvim",
		},

		config = function()
			require("competitest").setup({
				compile_command = {
					c = {
						exec = "gcc",
						args = {
							"$(FNAME)",
							"-o",
							"$(FNOEXT)",
						},
					},

					cpp = {
						exec = "g++",
						args = {
							"-std=c++17",
							"-O2",
							"-Wall",
							"$(FNAME)",
							"-o",
							"$(FNOEXT)",
						},
					},

					java = {
						exec = "javac",
						args = {
							"$(FNAME)",
						},
					},
				},

				run_command = {
					c = {
						exec = "./$(FNOEXT)",
					},

					cpp = {
						exec = "./$(FNOEXT)",
					},

					java = {
						exec = "java",
						args = {
							"$(FNOEXT)",
						},
					},

					python = {
						exec = "python",
						args = {
							"$(FNAME)",
						},
					},
				},
			})
			vim.keymap.set("n", "<leader>rr", "<cmd>CompetiTest run<CR>", {
				desc = "Run testcases",
			})

			vim.keymap.set("n", "<leader>ra", "<cmd>CompetiTest add_testcase<CR>", {
				desc = "Add testcase",
			})

			vim.keymap.set("n", "<leader>re", "<cmd>CompetiTest edit_testcase<CR>", {
				desc = "Edit testcase",
			})
		end,
	},
}
