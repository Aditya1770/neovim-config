local M = {}

M.colors = require("config.palette")

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
	set("WhichKeyNormal", { bg = c.panel })

	set("BlinkCmpMenu", { bg = c.completion_bg, fg = c.fg })
	set("BlinkCmpMenuBorder", { bg = c.completion_bg, fg = "#263438" })
	set("BlinkCmpMenuSelection", {
		bg = c.completion_selected,
		fg = c.completion_bg,
		bold = false,
	})
	set("BlinkCmpLabel", { fg = c.fg })
	set("BlinkCmpLabelDeprecated", { fg = c.muted, strikethrough = true })
	set("BlinkCmpLabelMatch", { fg = c.blue, bold = true })
	set("BlinkCmpLabelDescription", { fg = c.muted })
	set("BlinkCmpLabelDetail", { fg = c.muted })
	set("BlinkCmpKind", { fg = c.muted })
	set("BlinkCmpSource", { fg = c.muted })
	set("BlinkCmpScrollBarThumb", { bg = c.border })
	set("BlinkCmpScrollBarGutter", { bg = c.completion_bg })

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
	set("BlinkCmpSignatureHelp", { bg = c.completion_bg, fg = c.fg })
	set("BlinkCmpSignatureHelpBorder", { bg = c.completion_bg, fg = "#263438" })
	set("BlinkCmpSignatureHelpActiveParameter", { fg = c.accent, bold = true })

	if package.loaded.bufferline and M.apply_bufferline then
		vim.schedule(M.apply_bufferline)
	end
end

function M.setup()
	M.apply()
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = vim.api.nvim_create_augroup("theme_overrides", { clear = true }),
		callback = M.apply,
	})
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
		close_button_visible = { fg = "#232a2d", bg = c.panel },
		separator = { fg = c.panel, bg = c.panel },
		separator_selected = { fg = c.panel, bg = c.bg },
		indicator_selected = { fg = c.green, bg = c.bg },
	}
end

function M.apply_bufferline()
	local inactive_bg = tonumber(M.colors.panel:sub(2), 16)
	local selected_bg = tonumber(M.colors.bg:sub(2), 16)
	local highlights = vim.api.nvim_get_hl(0, {})

	for name, value in pairs(highlights) do
		local is_bufferline = name:match("^BufferLine")
		local is_buffer_icon = name:match("^DevIcon.*Inactive$") or name:match("^DevIcon.*Selected$")

		if is_bufferline or is_buffer_icon then
			value.bg = name:match("Selected$") and selected_bg or inactive_bg
			value.link = nil
			vim.api.nvim_set_hl(0, name, value)
		end
	end
end

return M
