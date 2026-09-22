local last_task

local function command_for_file()
	local file = vim.fn.expand("%:p")
	local name = vim.fn.expand("%:t")
	local stem = vim.fn.expand("%:t:r")
	local dir = vim.fn.expand("%:p:h")
	local ft = vim.bo.filetype

	if file == "" then
		return nil, "Save the file before running it"
	end

	local cache_dir = vim.fn.stdpath("cache") .. "/runner"
	vim.fn.mkdir(cache_dir, "p")
	local output = cache_dir .. "/" .. stem

	local commands = {
		cpp = {
			"sh",
			"-c",
			'g++ "$1" -std=c++17 -O2 -Wall -Wextra -o "$2" && "$2"',
			"runner",
			file,
			output,
		},
		c = {
			"sh",
			"-c",
			'gcc "$1" -O2 -Wall -Wextra -o "$2" && "$2"',
			"runner",
			file,
			output,
		},
		python = { "python", file },
		lua = { "lua", file },
		go = { "go", "run", file },
		java = {
			"sh",
			"-c",
			'javac "$1" && java -cp "$2" "$3"',
			"runner",
			file,
			dir,
			stem,
		},
	}

	if ft == "gomod" then
		return nil, "A go.mod file is module metadata. Open a .go source file to run it"
	end

	if not commands[ft] then
		return nil, "No runner configured for " .. (ft ~= "" and ft or name)
	end

	return {
		cmd = commands[ft],
		cwd = dir,
		name = "Run " .. name,
		components = { "on_exit_set_status", "on_complete_notify" },
	}
end

local function run_current_file()
	vim.cmd.update()

	local definition, err = command_for_file()
	if not definition then
		vim.notify(err, vim.log.levels.ERROR, { title = "Runner" })
		return
	end

	if last_task then
		last_task:dispose(true)
	end

	last_task = require("overseer").new_task(definition)
	last_task:start()
	last_task:open_output("horizontal")
	vim.cmd.resize(12)
end

local function open_last_output()
	if not last_task then
		vim.notify("No file has been run yet", vim.log.levels.INFO, { title = "Runner" })
		return
	end

	last_task:open_output("horizontal")
	vim.cmd.resize(12)
end

local function stop_last_task()
	if last_task and not last_task:is_complete() then
		last_task:stop()
	end
end

return {
	"stevearc/overseer.nvim",
	cmd = { "OverseerRun", "OverseerToggle", "OverseerTaskAction" },
	keys = {
		{ "<leader>r", run_current_file, desc = "Run current file" },
		{ "<leader>ro", open_last_output, desc = "Open runner output" },
		{ "<leader>rs", stop_last_task, desc = "Stop runner" },
	},
	opts = {
		strategy = "terminal",
		output = {
			use_terminal = true,
			preserve_output = false,
		},
		task_list = {
			direction = "bottom",
			min_height = 8,
			max_height = 12,
		},
	},
}
