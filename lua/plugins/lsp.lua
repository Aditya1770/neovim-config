return {
	{
		"neovim/nvim-lspconfig",

		config = function()
			vim.lsp.enable({
				"clangd",
				"jdtls",
				"pyright",
			})

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
				desc = "Go to definition",
			})

			vim.keymap.set("n", "gr", vim.lsp.buf.references, {
				desc = "Find references",
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {
				desc = "Hover documentation",
			})

			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {
				desc = "Rename symbol",
			})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
				desc = "Rename symbol",
			})

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
				desc = "Code action",
			})

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {
				desc = "Previous diagnostic",
			})

			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {
				desc = "Next diagnostic",
			})

			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
				desc = "Show diagnostic",
			})
		end,
	},
}
