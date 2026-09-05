return {
	{
		"NightCS/night.nvim",
		name = "night",
		lazy = false,
		priority = 1000,

		config = function()
			require("night").setup({
				nvim_tree = {
					contrast = true,
				},
			})

			vim.cmd("colorscheme night")

			local bg = "#0A1114"
			local separator = "#1c2529"

			vim.api.nvim_set_hl(0, "LineNr", {
				fg = "#263438",
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "LineNrAbove", {
				fg = "#2b3438",
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "LineNrBelow", {
				fg = "#2b3438",
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "CursorLine", {
				bg = "#141b1e",
			})

			vim.api.nvim_set_hl(0, "CursorLineNr", {
				fg = "#b3b9b8",
				bg = bg,
				bold = true,
			})

			vim.api.nvim_set_hl(0, "SignColumn", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "FoldColumn", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "Normal", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NormalNC", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "SignColumn", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "EndOfBuffer", {
				fg = bg,
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "WinSeparator", {
				fg = separator,
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "VertSplit", {
				fg = separator,
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeNormal", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", {
				fg = bg,
				bg = bg,
			})

			vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", {
				fg = separator,
				bg = bg,
			})

			-- Blink CMP

			local bg = "#10181b"
			local bg_sel = "#1d2a2f"
			local border = "#314147"

			local fg = "#dadada"
			local muted = "#7b8b91"

			local red = "#e57474"
			local green = "#8ccf7e"
			local yellow = "#e5c76b"
			local blue = "#67b0e8"
			local purple = "#c47fd5"
			local cyan = "#6cbfbf"
			local orange = "#e5a46b"

			vim.api.nvim_set_hl(0, "BlinkCmpMenu", {
				bg = bg,
				fg = fg,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", {
				bg = bg,
				fg = border,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {
				bg = bg_sel,
				fg = fg,
				bold = false,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpLabel", {
				fg = fg,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", {
				fg = muted,
				strikethrough = true,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", {
				fg = blue,
				bold = true,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", {
				fg = muted,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKind", {
				fg = muted,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindText", {
				fg = fg,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", {
				fg = blue,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", {
				fg = blue,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", {
				fg = cyan,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindField", {
				fg = yellow,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", {
				fg = purple,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindClass", {
				fg = cyan,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", {
				fg = cyan,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindModule", {
				fg = cyan,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", {
				fg = yellow,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindUnit", {
				fg = orange,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindValue", {
				fg = orange,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", {
				fg = cyan,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", {
				fg = red,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", {
				fg = red,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindColor", {
				fg = purple,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindFile", {
				fg = blue,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindReference", {
				fg = cyan,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindFolder", {
				fg = blue,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindEnumMember", {
				fg = orange,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindConstant", {
				fg = orange,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindStruct", {
				fg = cyan,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindEvent", {
				fg = purple,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindOperator", {
				fg = red,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpKindTypeParameter", {
				fg = yellow,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpDoc", {
				bg = bg,
				fg = fg,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", {
				bg = bg,
				fg = border,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", {
				bg = bg,
				fg = border,
			})

			vim.api.nvim_set_hl(0, "BlinkCmpDocCursorLine", {
				bg = bg_sel,
			})

			vim.api.nvim_set_hl(0, "BufferLineBackground", {
				fg = "#657378",
				bg = "#141b1e",
			})

			vim.api.nvim_set_hl(0, "BufferLineBufferVisible", {
				fg = "#829095",
				bg = "#141b1e",
			})

			vim.api.nvim_set_hl(0, "BufferLineBufferSelected", {
				fg = "#dadada",
				bg = "#0A1114",
				bold = false,
				italic = false,
			})

			vim.api.nvim_set_hl(0, "BufferLineFill", {
				bg = "#141b1e",
			})

			vim.api.nvim_set_hl(0, "BufferLineCloseButton", {
                fg = "#232a2d",
				bg = "#141b1e",
			})

			vim.api.nvim_set_hl(0, "BufferLineSeparator", {
                fg = "#141b1e",
				bg = "#141b1e",
			})

			vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", {
                fg = "#232a2d",
				bg = "#0A1114",
			})

			vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible", {
                fg = "#141b1e",
				bg = "#0A1114",
			})
		end,
	},
}
