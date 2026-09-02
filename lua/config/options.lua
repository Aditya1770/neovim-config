vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.clipboard = "unnamedplus"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, {
			focus = false,
			scope = "cursor",
			border = "rounded",
			source = true,
		})
	end,
})

vim.opt.updatetime = 500
