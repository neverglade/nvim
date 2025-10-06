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
highlights.generate_syntax = function(scheme, options)
	local comment_italics = options.italic_comments and { styles.italic } or {}
	local optional_italics = options.italics and { styles.italic } or {}

	---This respects the transparency settings of the user.
	---@param colour_to_set string The intended background if transparency is disabled
	---@return string
	local function transparency_respecting_colour(colour_to_set)
		if options.transparent_background > 0 then
			return scheme.none
		else
			return colour_to_set
		end
	end

	---@type Neverglade.Highlights
	local syntax = {
		ColorColumn = syntax_entry(scheme.none, scheme.root),
		Conceal = syntax_entry(scheme.bark, scheme.gray0),
		CurSearch = { link = "IncSearch" },
		Cursor = syntax_entry(scheme.none, scheme.none, { styles.reverse }),
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		CursorColumn = syntax_entry(scheme.none, scheme.root),
		CursorLine = syntax_entry(scheme.none, scheme.root),
		Directory = syntax_entry(scheme.lichen, scheme.none),
		--- DiffAdd, DiffChange, DiffDelete, DiffText
		EndOfBuffer = syntax_entry((options.show_eob and scheme.branch) or scheme.root, scheme.none),
		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },
		ErrorMsg = syntax_entry(scheme.ember, scheme.none, { styles.bold, styles.underline }),
		WinSeperator = { link = "VertSplit" },
		Folded = syntax_entry(scheme.gray1, transparency_respecting_colour(scheme.root)),
		--- FoldColumn, SignColumn
		IncSearch = syntax_entry(scheme.root, scheme.ember),
		Substitute = syntax_entry(scheme.root, scheme.ochre),
		LineNr = syntax_entry(scheme.bark, scheme.none),
		LineNrAbove = syntax_entry(scheme.bark, scheme.none),
		LineNrBelow = syntax_entry(scheme.bark, scheme.none),
		CursorLineNr = syntax_entry(scheme.gray1, scheme.root),
		MatchParen = syntax_entry(scheme.none, scheme.branch),
		ModeMsg = syntax_entry(scheme.text, scheme.none, { styles.bold }),
		MoreMsg = syntax_entry(scheme.ochre, scheme.none, { styles.bold }),
		NonText = syntax_entry(scheme.branch, scheme.none),
		Normal = syntax_entry(scheme.text, transparency_respecting_colour(scheme.root)),
		NormalFloat = syntax_entry(scheme.text, scheme.earth),
		FloatBorder = syntax_entry(scheme.gray1, scheme.earth),
		FloatTitle = syntax_entry(scheme.gray1, scheme.earth, { styles.bold }),

		Fg = syntax_entry(scheme.text, scheme.none),
		Grey = syntax_entry(scheme.gray1, scheme.none),
		Red = syntax_entry(scheme.ember, scheme.none),
		Orange = syntax_entry(scheme.rust, scheme.none),
		Yellow = syntax_entry(scheme.ochre, scheme.none),
		Green = syntax_entry(scheme.lichen, scheme.none),
		Aqua = syntax_entry(scheme.aurora, scheme.none),
		Blue = syntax_entry(scheme.sky, scheme.none),
		Purple = syntax_entry(scheme.lavender, scheme.none),

		RedItalic = syntax_entry(scheme.ember, scheme.none, optional_italics),
		OrangeItalic = syntax_entry(scheme.rust, scheme.none, optional_italics),
		YellowItalic = syntax_entry(scheme.ochre, scheme.none, optional_italics),
		GreenItalic = syntax_entry(scheme.lichen, scheme.none, optional_italics),
		AquaItalic = syntax_entry(scheme.aurora, scheme.none, optional_italics),
		BlueItalic = syntax_entry(scheme.sky, scheme.none, optional_italics),
		PurpleItalic = syntax_entry(scheme.lavender, scheme.none, optional_italics),

		RedBold = syntax_entry(scheme.ember, scheme.none, { styles.bold }),
		OrangeBold = syntax_entry(scheme.rust, scheme.none, { styles.bold }),
		YellowBold = syntax_entry(scheme.ochre, scheme.none, { styles.bold }),
		GreenBold = syntax_entry(scheme.lichen, scheme.none, { styles.bold }),
		AquaBold = syntax_entry(scheme.aurora, scheme.none, { styles.bold }),
		BlueBold = syntax_entry(scheme.sky, scheme.none, { styles.bold }),
		PurpleBold = syntax_entry(scheme.lavender, scheme.none, { styles.bold }),

		--- Treesitter
		TSStrong = syntax_entry(scheme.none, scheme.none, { styles.bold }),
		TSEmphasis = syntax_entry(scheme.none, scheme.none, { styles.italic }),
		TSUnderline = syntax_entry(scheme.none, scheme.none, { styles.underline }),
		TSStrike = syntax_entry(scheme.none, scheme.none, { styles.strikethrough }),
		TSNote = syntax_entry(scheme.root, scheme.lichen, { styles.bold }),
		TSWarning = syntax_entry(scheme.root, scheme.ochre, { styles.bold }),
		TSDanger = syntax_entry(scheme.root, scheme.ember, { styles.bold }),
	}

	return syntax
end

return highlights
