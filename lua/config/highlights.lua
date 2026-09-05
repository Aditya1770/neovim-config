local M = {}

M.colors = {
	bg = "#0A1114",
	panel = "#141b1e",
	completion_bg = "#10181b",
	completion_selected = "#719fdd",
	border = "#314147",
	separator = "#1c2529",
	fg = "#dadada",
	muted = "#7b8b91",
	red = "#e57474",
	green = "#8ccf7e",
	yellow = "#e5c76b",
	blue = "#67b0e8",
	purple = "#c47fd5",
	cyan = "#6cbfbf",
	orange = "#e5a46b",
}

local function set(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.apply()
	local c = M.colors

	set("Normal", { bg = c.bg })
	set("NormalNC", { bg = c.bg })
	set("LineNr", { fg = "#263438", bg = c.bg })
	set("LineNrAbove", { fg = "#2b3438", bg = c.bg })
	set("LineNrBelow", { fg = "#2b3438", bg = c.bg })
	set("CursorLine", { bg = c.panel })
	set("CursorLineNr", { fg = "#b3b9b8", bg = c.bg, bold = true })
	set("SignColumn", { bg = c.bg })
	set("FoldColumn", { bg = c.bg })
	set("EndOfBuffer", { fg = c.bg, bg = c.bg })
	set("WinSeparator", { fg = c.separator, bg = c.bg })
	set("VertSplit", { fg = c.separator, bg = c.bg })

	set("NeoTreeNormal", { bg = c.bg })
	set("NeoTreeNormalNC", { bg = c.bg })
	set("NeoTreeEndOfBuffer", { fg = c.bg, bg = c.bg })
	set("NeoTreeWinSeparator", { fg = c.separator, bg = c.bg })
	set("NeoTreeRootName", { fg = "#8c9fa3", bg = c.bg, bold = false, italic = false })
	set("NeoTreeDirectoryName", { fg = "#719fdd", bold = false, italic = false })
	set("NeoTreeDirectoryIcon", { fg = "#719fdd" })
	set("NeoTreeFileName", { fg = "#c8d1d3", bold = false, italic = false })
	set("NeoTreeFileNameOpened", { fg = "#c8d1d3", bold = false, italic = false })
	set("NeoTreeIndentMarker", { fg = "#263438" })
	set("NeoTreeExpander", { fg = "#61777d" })
	set("NeoTreeCursorLine", { bg = c.panel })
	set("NeoTreeDimText", { fg = "#4b595d", italic = true })

	set("AlphaHeader", { fg = c.blue })
	set("IblIndent", { fg = "#182326" })
	set("IblScope", { fg = "#243236" })

	set("BlinkCmpMenu", { bg = c.completion_bg, fg = c.fg })
	set("BlinkCmpMenuBorder", { bg = c.completion_bg, fg = c.border })
	set("BlinkCmpMenuSelection", { bg = c.completion_selected, fg = c.fg, bold = false })
	set("BlinkCmpLabel", { fg = c.fg })
	set("BlinkCmpLabelDeprecated", { fg = c.muted, strikethrough = true })
	set("BlinkCmpLabelMatch", { fg = c.blue, bold = true })
	set("BlinkCmpLabelDescription", { fg = c.muted })
	set("BlinkCmpKind", { fg = c.muted })

	local kinds = {
		Text = c.fg,
		Method = c.blue,
		Function = c.blue,
		Constructor = c.cyan,
		Field = c.yellow,
		Variable = c.purple,
		Class = c.cyan,
		Interface = c.cyan,
		Module = c.cyan,
		Property = c.yellow,
		Unit = c.orange,
		Value = c.orange,
		Enum = c.cyan,
		Keyword = c.red,
		Snippet = c.red,
		Color = c.purple,
		File = c.blue,
		Reference = c.cyan,
		Folder = c.blue,
		EnumMember = c.orange,
		Constant = c.orange,
		Struct = c.cyan,
		Event = c.purple,
		Operator = c.red,
		TypeParameter = c.yellow,
	}

	for kind, color in pairs(kinds) do
		set("BlinkCmpKind" .. kind, { fg = color })
	end

	set("BlinkCmpDoc", { bg = c.completion_bg, fg = c.fg })
	set("BlinkCmpDocBorder", { bg = c.completion_bg, fg = c.border })
	set("BlinkCmpDocSeparator", { bg = c.completion_bg, fg = c.border })
	set("BlinkCmpDocCursorLine", { bg = c.panel })
end

function M.setup()
	M.apply()
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("theme_overrides", { clear = true }),
		callback = M.apply,
	})
end

function M.lualine_theme()
	local theme = require("lualine.themes.auto")

	for _, mode in pairs(theme) do
		if type(mode) == "table" and mode.c then
			mode.c.bg = M.colors.panel
		end
	end

	return theme
end

function M.bufferline()
	local c = M.colors
	return {
		background = { fg = "#657378", bg = c.panel },
		buffer_visible = { fg = "#829095", bg = c.panel, bold = false, italic = false },
		buffer_selected = { fg = c.fg, bg = c.bg, bold = false, italic = false },
		fill = { bg = c.panel },
		close_button = { fg = "#232a2d", bg = c.panel },
		close_button_selected = { fg = "#232a2d", bg = c.bg },
		close_button_visible = { fg = c.panel, bg = c.bg },
		separator = { fg = c.panel, bg = c.panel },
	}
end

return M
