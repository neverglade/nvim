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
	-- Comments are italic by default
	local comment_italics = options.italic_comments and { styles.italic } or {}
	-- All other italics are disabled by default
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
		Cursor = syntax_entry(scheme.none, scheme.none, { styles.reverse }),
		Normal = syntax_entry(scheme.text, scheme.root),
	}
end
