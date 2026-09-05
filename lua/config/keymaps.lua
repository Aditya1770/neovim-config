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

local run_win = nil
local run_buf = nil

local function run_in_terminal(cmd)
	if run_win and vim.api.nvim_win_is_valid(run_win) then
		vim.api.nvim_set_current_win(run_win)

		if run_buf and vim.api.nvim_buf_is_valid(run_buf) then
			vim.api.nvim_buf_delete(run_buf, { force = true })
		end

		vim.cmd("enew")
	else
		vim.cmd("botright 12split")
		run_win = vim.api.nvim_get_current_win()
	end

	vim.cmd("terminal " .. cmd)

	run_buf = vim.api.nvim_get_current_buf()

	vim.bo[run_buf].bufhidden = "wipe"
end

map("n", "<leader>r", function()
	vim.cmd("write")

	local ft = vim.bo.filetype
	local filename = vim.fn.expand("%:t")
	local file = vim.fn.shellescape(vim.fn.expand("%:p"))
	local output = vim.fn.shellescape(vim.fn.expand("%:p:r"))

	vim.notify("Running " .. filename .. "...", vim.log.levels.INFO)

	if ft == "cpp" then
		run_in_terminal("g++ " .. file .. " -std=c++17 -O2 -o " .. output .. " && " .. output)
	elseif ft == "c" then
		run_in_terminal("gcc " .. file .. " -o " .. output .. " && " .. output)
	elseif ft == "python" then
		run_in_terminal("python " .. file)
	elseif ft == "java" then
		local dir = vim.fn.shellescape(vim.fn.expand("%:p:h"))
		local classname = vim.fn.expand("%:t:r")

		run_in_terminal("cd " .. dir .. " && javac " .. file .. " && java " .. classname)
	end
end, {
	desc = "Run current file",
})

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
