local defaults = {
	bg = "#0A1114",
	panel = "#141b1e",
	section = "#20282c",
	completion_bg = "#10181b",
	completion_selected = "#719fdd",
	border = "#314147",
	separator = "#1c2529",
	fg = "#dadada",
	soft_fg = "#c8d1d3",
	muted = "#7b8b91",
	red = "#e57474",
	green = "#8ccf7e",
	yellow = "#e5c76b",
	blue = "#67b0e8",
	accent = "#719fdd",
	purple = "#c47fd5",
	cyan = "#6cbfbf",
	orange = "#e5a46b",
	line_nr = "#263438",
	line_nr_dim = "#2b3438",
	cursor_line_nr = "#b3b9b8",
	tree_root = "#8c9fa3",
	tree_directory = "#719fdd",
	tree_file = "#c8d1d3",
	tree_indent = "#263438",
	tree_expander = "#61777d",
	tree_dim = "#4b595d",
	cmp_border = "#263438",
	buffer_muted = "#657378",
	buffer_visible = "#829095",
	buffer_close = "#232a2d",
	status_muted = "#8c9fa3",
}

local M = {}

function M.reload()
	for name, value in pairs(defaults) do
		M[name] = value
	end

	local generated = vim.fn.stdpath("config") .. "/lua/config/fianchetto.lua"
	local ok, overrides = pcall(dofile, generated)
	if ok and type(overrides) == "table" then
		for name, value in pairs(overrides) do
			if defaults[name] and type(value) == "string" then
				M[name] = value
			end
		end
	end
end

M.reload()

return M
