---@class Neverglade.HighlightGroup
local M = {}

function M.get()
	local comment_italics = O.italic_comments and { S.italic } or {}
	local italics = O.italics and { S.italic } or {}

	return {
		Boolean = { fg = C.lavender },
		Number = { fg = C.lavender },
		Float = { fg = C.lavender },

		PreProc = { fg = C.lavender, style = italics },
		PreCondit = { fg = C.lavender, style = italics },
		Include = { fg = C.lavender, style = italics },
		Conditional = { fg = C.ember, style = italics },
		Repeat = { fg = C.ember, style = italics },
		Keyword = { fg = C.ember, style = italics },
		Typedef = { fg = C.ember, style = italics },
		Type = { fg = C.ochre, style = italics },
		Exception = { fg = C.ember, style = italics },
		Statement = { fg = C.ember, style = italics },

		Error = { fg = C.ember },
		StorageClass = { fg = C.rust },
		Tag = { fg = C.rust },
		Structure = { fg = C.rust },
		Operator = { fg = C.rust },
		Special = { fg = C.ochre },
		SpecialChar = { fg = C.ochre },
		Function = { fg = C.lichen },
		String = { fg = C.moss },
		Character = { fg = C.moss },
		Constant = { fg = C.aurora },
		Macro = { fg = C.aurora },
		Identifier = { fg = C.sky },
		Label = { fg = C.rust },

		Comment = { fg = C.subtext0, style = comment_italics },
		SpecialComment = { link = "Special" },

		Delimiter = { fg = C.text },
		Ignore = { fg = C.gray1 },
		Underlined = { style = { S.underline } },
		Bold = { style = { S.bold } },
		Italic = { style = italics },
	}
end

return M
