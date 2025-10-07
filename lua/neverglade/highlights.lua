---@class Neverglade.Highlighter
local highlights = {}

---@type Neverglade.ColourUtility
local c_util = require("neverglade.color_util")

---@enum Styles
local styles = {
	bold = "bold",
	italic = "italic",
	reverse = "reverse",
	undercurl = "undercurl",
	underline = "underline",
	standout = "standout",
	strikethrough = "strikethrough",
	nocombine = "nocombine",
}

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

---Generates the various highlight groups for this colour scheme to be used by Neovim.
highlights.generate_syntax = function(s, options)
	local comment_italics = options.italic_comments and { styles.italic } or {}
	local optional_italics = options.italics and { styles.italic } or {}

	---This respects the transparency settings of the user.
	---@param colour_to_set string The intended background if tranparency is disabled
	---@return string
	local function transparency_respecting_colour(colour_to_set)
		if options.transparent_background > 0 then
			return s.none
		else
			return colour_to_set
		end
	end

	---@type Neverglade.Highlights
	local syntax = {
		ColorColumn = syntax_entry(s.none, s.root),
		Conceal = syntax_entry(s.bark, s.gray0),
		CurSearch = { link = "IncSearch" },
		Cursor = syntax_entry(s.none, s.none, { styles.reverse }),
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		CursorColumn = syntax_entry(s.none, s.root),
		CursorLine = syntax_entry(s.none, s.root),
		Directory = syntax_entry(s.lichen, s.none),
		--- DiffAdd, DiffChange, DiffDelete, DiffText
		EndOfBuffer = syntax_entry((options.show_eob and s.branch) or s.root, s.none),
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		ErrorMsg = syntax_entry(s.ember, s.none, { styles.bold, styles.underline }),
		WinSeperator = { link = "VertSplit" },
		Folded = syntax_entry(s.gray1, transparency_respecting_colour(s.root)),
		--- FoldColumn, SignColumn
		IncSearch = syntax_entry(s.root, s.ember),
		Substitute = syntax_entry(s.root, s.ochre),
		LineNr = syntax_entry(s.bark, s.none),
		LineNrAbove = syntax_entry(s.bark, s.none),
		LineNrBelow = syntax_entry(s.bark, s.none),
		CursorLineNr = syntax_entry(s.gray1, s.root),
		MatchParen = syntax_entry(s.none, s.branch),
		ModeMsg = syntax_entry(s.text, s.none, { styles.bold }),
		MoreMsg = syntax_entry(s.ochre, s.none, { styles.bold }),
		NonText = syntax_entry(s.branch, s.none),
		Normal = syntax_entry(s.text, transparency_respecting_colour(s.root)),
		NormalFloat = syntax_entry(s.text, s.earth),
		FloatBorder = syntax_entry(s.gray1, s.earth),
		FloatTitle = syntax_entry(s.gray1, s.earth, { styles.bold }),
		NormalNC = syntax_entry(s.text, s.root),
		Pmenu = syntax_entry(s.text, s.sapwood),
		PmenuSbar = syntax_entry(s.none, s.sapwood),
		PmenuSel = syntax_entry(s.root, s.lichen),
		PmenuThumb = syntax_entry(s.none, s.gray0),
		Question = syntax_entry(s.ochre, s.none),
		QuickFixLine = syntax_entry(s.lavender, s.none, { styles.bold }),
		Search = syntax_entry(s.root, s.lichen),
		SpecialKey = syntax_entry(s.ochre, s.none),
		--- SpellBad, SpellLocal, SpellRare
		StatusLine = syntax_entry(s.gray1, s.sapwood),
		StatusLineNC = syntax_entry(
			options.transparent_background == 2 and s.gray0 or s.gray1,
			options.transparent_background == 2 and s.none or s.heartwood
		),
		TabLine = syntax_entry(s.gray2, s.heartwood),
		TabLineFill = syntax_entry(s.gray1, s.heartwood),
		TabLineSel = syntax_entry(s.root, s.lichen),
		Title = syntax_entry(s.rust, s.none, { styles.bold }),
		Visual = syntax_entry(s.none, c_util.blend_bg(s.lichen, 0.3, s.root)),
		VisualNOS = syntax_entry(s.none, c_util.blend_bg(s.lichen, 0.3, s.root)),
		WarningMsg = syntax_entry(s.ochre, s.none, { styles.bold }),
		Whitespace = syntax_entry(s.bark, s.none),
		WildMenu = { link = "PmenuSel" },
		WinBar = syntax_entry(s.gray1, s.sapwood, { styles.bold }),
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

		EmberItalic = syntax_entry(s.ember, s.none, optional_italics),
		RustItalic = syntax_entry(s.rust, s.none, optional_italics),
		OchreItalic = syntax_entry(s.ochre, s.none, optional_italics),
		LichenItalic = syntax_entry(s.lichen, s.none, optional_italics),
		AuroraItalic = syntax_entry(s.aurora, s.none, optional_italics),
		SkyItalic = syntax_entry(s.sky, s.none, optional_italics),
		LavenderItalic = syntax_entry(s.lavender, s.none, optional_italics),

		EmberBold = syntax_entry(s.ember, s.none, { styles.bold }),
		RustBold = syntax_entry(s.rust, s.none, { styles.bold }),
		OchreBold = syntax_entry(s.ochre, s.none, { styles.bold }),
		LichenBold = syntax_entry(s.lichen, s.none, { styles.bold }),
		AuroraBold = syntax_entry(s.aurora, s.none, { styles.bold }),
		SkyBold = syntax_entry(s.sky, s.none, { styles.bold }),
		LavenderBold = syntax_entry(s.lavender, s.none, { styles.bold }),

		Added = { link = "Moss" },
		Removed = { link = "Ember" },
		Changed = { link = "Aurora" },

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
		Underlined = syntax_entry(s.none, s.none, { styles.underline }),

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

	return syntax
end

return highlights
