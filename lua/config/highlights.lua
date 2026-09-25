local M = {}
local palette_watcher
local reload_pending = false

M.colors = require("config.palette")

local function set(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.apply()
	local c = M.colors

	set("Normal", { bg = c.bg })
	set("NormalNC", { bg = c.bg })
	set("LineNr", { fg = c.line_nr, bg = c.bg })
	set("LineNrAbove", { fg = c.line_nr_dim, bg = c.bg })
	set("LineNrBelow", { fg = c.line_nr_dim, bg = c.bg })
	set("CursorLine", { bg = c.panel })
	set("CursorLineNr", { fg = c.cursor_line_nr, bg = c.bg, bold = true })
	set("SignColumn", { bg = c.bg })
	set("FoldColumn", { bg = c.bg })
	set("EndOfBuffer", { fg = c.bg, bg = c.bg })
	set("WinSeparator", { fg = c.separator, bg = c.bg })
	set("VertSplit", { fg = c.separator, bg = c.bg })

	set("NeoTreeNormal", { bg = c.bg })
	set("NeoTreeNormalNC", { bg = c.bg })
	set("NeoTreeEndOfBuffer", { fg = c.bg, bg = c.bg })
	set("NeoTreeWinSeparator", { fg = c.separator, bg = c.bg })
	set("NeoTreeRootName", { fg = c.tree_root, bg = c.bg, bold = false, italic = false })
	set("NeoTreeDirectoryName", { fg = c.tree_directory, bold = false, italic = false })
	set("NeoTreeDirectoryIcon", { fg = c.tree_directory })
	set("NeoTreeFileName", { fg = c.tree_file, bold = false, italic = false })
	set("NeoTreeFileNameOpened", { fg = c.tree_file, bold = false, italic = false })
	set("NeoTreeIndentMarker", { fg = c.tree_indent })
	set("NeoTreeExpander", { fg = c.tree_expander })
	set("NeoTreeCursorLine", { bg = c.panel })
	set("NeoTreeDimText", { fg = c.tree_dim, italic = true })

	set("AlphaHeader", { fg = c.blue })
	set("IblIndent", { fg = "#182326" })
	set("IblScope", { fg = "#243236" })
	set("WhichKeyNormal", { bg = c.panel })

	set("BlinkCmpMenu", { bg = c.completion_bg, fg = c.fg })
	set("BlinkCmpMenuBorder", { bg = c.completion_bg, fg = c.cmp_border })
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
	set("BlinkCmpSignatureHelpBorder", { bg = c.completion_bg, fg = c.cmp_border })
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

	-- Fianchetto atomically replaces its generated palette whenever Matugen
	-- changes. Watch the directory so replacement events are caught reliably.
	local config_dir = vim.fn.stdpath("config") .. "/lua/config"
	local uv = vim.uv or vim.loop
	palette_watcher = uv.new_fs_event()
	if palette_watcher then
		palette_watcher:start(config_dir, {}, vim.schedule_wrap(function(error, filename)
			if error or filename ~= "fianchetto.lua" or reload_pending then
				return
			end
			reload_pending = true
			vim.defer_fn(function()
				require("config.palette").reload()
				M.colors = require("config.palette")
				M.apply()
				vim.api.nvim_exec_autocmds("User", { pattern = "FianchettoThemeChanged" })
				reload_pending = false
			end, 80)
		end))
	end
end

function M.bufferline()
	local c = M.colors
	return {
		background = { fg = c.buffer_muted, bg = c.panel },
		buffer_visible = { fg = c.buffer_visible, bg = c.panel, bold = false, italic = false },
		buffer_selected = { fg = c.fg, bg = c.bg, bold = false, italic = false },
		fill = { bg = c.panel },
		close_button = { fg = c.buffer_close, bg = c.panel },
		close_button_selected = { fg = c.buffer_close, bg = c.bg },
		close_button_visible = { fg = c.buffer_close, bg = c.panel },
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
