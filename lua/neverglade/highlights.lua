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
	---@param colour_to_set string The intended background if transparency is disabled
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

		Terminal = syntax_entry(s.text, s.root),
		VertSplit = syntax_entry(s.bark, s.none),

		--- Syntax
		Comment = syntax_entry(s.subtext1, s.none, comment_italics and { styles.italic } or {}),
		Constant = { link = "Aurora" },
		String = { link = "Lichen" },
		Character = { link = "Aurora" },
		Number = { link = "Peony" },
		Float = { link = "Number" },
		Boolean = { link = "Peony" },
		Function = { link = "Aurora" },

		Text = syntax_entry(s.text, s.none),
		Gray = syntax_entry(s.gray1, s.none),
		Ember = syntax_entry(s.ember, s.none),
		Rust = syntax_entry(s.rust, s.none),
		Ochre = syntax_entry(s.ochre, s.none),
		Lichen = syntax_entry(s.lichen, s.none),
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

		--- Treesitter
		["@variable"] = { link = "Fg" },
		["@variable.builtin"] = { link = "LavenderItalic" },
		["@variable.parameter"] = { link = "Text" },
		["@variable.member"] = { link = "Sky" },

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
