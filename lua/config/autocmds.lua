vim.api.nvim_create_autocmd("CursorHold", {
	group = vim.api.nvim_create_augroup("diagnostics_on_hover", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, {
			focus = false,
			scope = "cursor",
			border = "rounded",
			source = true,
		})
	end,
})
