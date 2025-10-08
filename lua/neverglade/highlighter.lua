---@class Neverglade.Highlighter
local M = {}

---@type Neverglade.ColourUtility
local c_util = require("neverglade.color_util")

---Generates a table that can be accepted by nvim_set_hl
---@param fg string
---@param bg string
---@param stylings? Styles[]
---@param sp? string
---@return { fg: string, bg: string, [Styles]: boolean?, sp: string? }
local function syntax_entry(fg, bg, stylings, sp)
	---@type { fg: string, bg: string, [Styles]: boolean?, sp: string? }
	local highlight = { fg = fg, bg = bg }

	if stylings then
		for _, style in ipairs(stylings) do
			highlight[style] = true
		end
	end

	if sp then
		highlight["sp"] = sp
	end

	return highlight
end

---@param highlight Neverglade.Highlight
local function apply_styles(highlight)
	---@type {fg: string, bg: string, [Neverglade.HighlightArgs]: boolean?, sp: string}
	local hl = {
		fg = highlight.fg,
		bg = highlight.bg,
	}

	if highlight.style then
		for _, style in pairs(highlight.style) do
			hl[style] = true
		end
	end
	return hl
end

---@param t Neverglade.Highlights
---@return {fg: string, bg: string, [Styles]: boolean?, sp?: string}
local function apply_table(t)
	local ret = {}
	for g, hl in pairs(t) do
		ret[g] = apply_styles(hl)
	end

	return ret
end

---Generates the various highlight groups for this colour scheme to be used by Neovim.
M.generate_theme = function(s, options)
	---@enum Styles
	S = {
		bold = "bold",
		italic = "italic",
		reverse = "reverse",
		undercurl = "undercurl",
		underline = "underline",
		standout = "standout",
		strikethrough = "strikethrough",
		nocombine = "nocombine",
	}

	O = require("neverglade").config
	C = require("neverglade.colors").generate_scheme(O, O.variety)

	local optional_italics = { S.italic }
	local comment_italics = { S.italic }

	local theme = {}

	local editor = require("neverglade.groups.editor").get()
	theme = vim.tbl_deep_extend("force", theme, editor)

	theme = apply_table(theme)

	---@type Neverglade.Highlights
	local syntax = {
		--- DiffAdd, DiffChange, DiffDelete, DiffText
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		WinSeparator = { link = "VertSplit" },
		--- FoldColumn, SignColumn
		IncSearch = syntax_entry(s.root, s.ember),
		--- SpellBad, SpellLocal, SpellRare
		StatusLine = syntax_entry(s.gray1, s.sapwood),
		StatusLineNC = syntax_entry(
			options.transparent_background == 2 and s.gray0 or s.gray1,
			options.transparent_background == 2 and s.none or s.heartwood
		),
		TabLine = syntax_entry(s.gray2, s.heartwood),
		TabLineFill = syntax_entry(s.gray1, s.heartwood),
		TabLineSel = syntax_entry(s.root, s.lichen),
		Title = syntax_entry(s.rust, s.none, { S.bold }),
		Visual = syntax_entry(s.none, c_util.blend_bg(s.lichen, 0.3, s.root)),
		VisualNOS = syntax_entry(s.none, c_util.blend_bg(s.lichen, 0.3, s.root)),
		WarningMsg = syntax_entry(s.ochre, s.none, { S.bold }),
		Whitespace = syntax_entry(s.bark, s.none),
		WildMenu = { link = "PmenuSel" },
		WinBar = syntax_entry(s.gray1, s.sapwood, { S.bold }),
		WinBarNC = syntax_entry(s.gray1, s.heartwood),
		Terminal = syntax_entry(s.text, s.root),
		ToolbarLine = syntax_entry(s.text, s.sapwood),

		StatusLineTerm = syntax_entry(s.gray1, s.heartwood),
		StatusLineTermNC = syntax_entry(s.gray1, s.root),

		VertSplit = syntax_entry(s.bark, s.none),

		--- Syntax

		Text = syntax_entry(s.text, s.none),
		Gray = syntax_entry(s.gray1, s.none),
		Ember = syntax_entry(s.ember, s.none),
		Rust = syntax_entry(s.rust, s.none),
		Ochre = syntax_entry(s.ochre, s.none),
		Lichen = syntax_entry(s.lichen, s.none),
		Moss = syntax_entry(s.moss, s.none),
		Aurora = syntax_entry(s.aurora, s.none),
		Peony = syntax_entry(s.peony, s.none),
		Sky = syntax_entry(s.sky, s.none),
		Lavender = syntax_entry(s.lavender, s.none),
		Gray2 = syntax_entry(s.gray2, s.none),
		Gray1 = syntax_entry(s.gray1, s.none),
		Gray0 = syntax_entry(s.gray0, s.none),

		Added = { link = "Moss" },
		Removed = { link = "Ember" },
		Changed = { link = "Aurora" },

		ErrorText = syntax_entry(s.none, options.diagnostics.text and s.ember or s.none, { S.undercurl }),
		WarningText = syntax_entry(s.none, options.diagnostics.text and s.ochre or s.none, { S.undercurl }),
		InfoText = syntax_entry(s.none, options.diagnostics.text and s.sky or s.none, { S.undercurl }),
		HintText = syntax_entry(s.none, options.diagnostics.text and s.lavender or s.none, { S.undercurl }),

		--- Disable line styles
		ErrorLine = syntax_entry(s.none, s.none),
		WarningLine = syntax_entry(s.none, s.none),
		InfoLine = syntax_entry(s.none, s.none),
		HintLine = syntax_entry(s.none, s.none),

		VirtualTextWarning = { link = options.diagnostics.virtual == "gray" and "Gray1" or "Ochre" },
		VirtualTextError = { link = options.diagnostics.virtual == "gray" and "Gray1" or "Ember" },
		VirtualTextInfo = { link = options.diagnostics.virtual == "gray" and "Gray1" or "Sky" },
		VirtualTextHint = { link = options.diagnostics.virtual == "gray" and "Gray1" or "Lavender" },
		VirtualTextOk = { link = options.diagnostics.virtual == "gray" and "Gray1" or "Moss" },

		ErrorFloat = syntax_entry(s.ember, s.none),
		WarningFloat = syntax_entry(s.ochre, s.none),
		InfoFloat = syntax_entry(s.sky, s.none),
		HintFloat = syntax_entry(s.lavender, s.none),
		OkFloat = syntax_entry(s.moss, s.none),
		CurrentWord = syntax_entry(s.none, s.none, { S.bold }),

		--- LSP
		Boolean = syntax_entry(s.lavender, s.none),
		Number = syntax_entry(s.lavender, s.none),
		Float = syntax_entry(s.lavender, s.none),

		PreProc = syntax_entry(s.lavender, s.none, optional_italics),
		PreCondit = syntax_entry(s.lavender, s.none, optional_italics),
		Include = syntax_entry(s.lavender, s.none, optional_italics),
		Define = syntax_entry(s.lavender, s.none, optional_italics),
		Conditional = syntax_entry(s.ember, s.none, optional_italics),
		Repeat = syntax_entry(s.ember, s.none, optional_italics),
		Keyword = syntax_entry(s.ember, s.none, optional_italics),
		Typedef = syntax_entry(s.ember, s.none, optional_italics),
		Exception = syntax_entry(s.ember, s.none, optional_italics),
		Statement = syntax_entry(s.ember, s.none, optional_italics),

		Error = syntax_entry(s.ember, s.none),
		StorageClass = syntax_entry(s.rust, s.none),
		Tag = syntax_entry(s.rust, s.none),
		Structure = syntax_entry(s.rust, s.none),
		Operator = syntax_entry(s.rust, s.none),
		Special = syntax_entry(s.ochre, s.none),
		SpecialChar = syntax_entry(s.ochre, s.none),
		Type = syntax_entry(s.ochre, s.none),
		Function = syntax_entry(s.lichen, s.none),
		String = syntax_entry(s.moss, s.none),
		Character = syntax_entry(s.moss, s.none),
		Constant = syntax_entry(s.aurora, s.none),
		Macro = syntax_entry(s.aurora, s.none),
		Identifier = syntax_entry(s.sky, s.none),

		Comment = syntax_entry(s.subtext1, s.none, comment_italics),
		SpecialComment = syntax_entry(s.subtext1, s.none, comment_italics),

		Delimiter = syntax_entry(s.text, s.none),
		Ignore = syntax_entry(s.gray1, s.none),
		Underlined = syntax_entry(s.none, s.none, { S.underline }),

		--- Treesitter
		["@variable"] = { link = "Text" },
		["@variable.builtin"] = { link = "LavenderItalic" },
		["@variable.parameter"] = { link = "Text" },
		["@variable.member"] = { link = "aurora" },

		["@constant"] = { link = "Aurora" },
		["@constant.builtin"] = { link = "LavenderItalic" },
		["@constant.macro"] = { link = "LavenderItalic" },

		["@module"] = { link = "OchreItalic" },
		["@label"] = { link = "Rust" },

		["@string"] = { link = "String" },
	}

	if options.terminal then
		vim.g.terminal_color_0 = s.sapwood
		vim.g.terminal_color_8 = s.sapwood

		vim.g.terminal_color_1 = s.ember
		vim.g.terminal_color_9 = s.ember

		vim.g.terminal_color_2 = s.lichen
		vim.g.terminal_color_10 = s.lichen

		vim.g.terminal_color_3 = s.ochre
		vim.g.terminal_color_11 = s.ochre

		vim.g.terminal_color_4 = s.sky
		vim.g.terminal_color_12 = s.sky

		vim.g.terminal_color_5 = s.lavender
		vim.g.terminal_color_13 = s.lavender

		vim.g.terminal_color_6 = s.aurora
		vim.g.terminal_color_14 = s.aurora

		vim.g.terminal_color_7 = s.text
		vim.g.terminal_color_15 = s.text
	end

	return theme
end

return M
