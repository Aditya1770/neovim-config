local map = vim.keymap.set

-- Move lines
for _, key in ipairs({ "<A-j>", "<A-Down>" }) do
	map("n", key, ":m .+1<CR>==")
	map("v", key, ":m '>+1<CR>gv=gv")
end

for _, key in ipairs({ "<A-k>", "<A-Up>" }) do
	map("n", key, ":m .-2<CR>==")
	map("v", key, ":m '<-2<CR>gv=gv")
end

-- Buffer navigation
map("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", {
	desc = "Next buffer",
})

map("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<CR>", {
	desc = "Previous buffer",
})

-- Close current buffer
map("n", "<leader>x", "<cmd>bdelete<CR>", {
	desc = "Close buffer",
})
