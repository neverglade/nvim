---@class Neverglade.HighlightGroup
local M = {}

function M.get()
	local italics = O.italics and { S.italic } or {}

	return {
		["@variable"] = { fg = C.text },
		["@variable.builtin"] = { fg = C.lavender, style = italics },
		["@variable.parameter"] = { fg = C.text },
		["@variable.member"] = { fg = C.sky },

		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = C.lavender, style = italics },
		["@constant.macro"] = { fg = C.lavender, style = italics },

		["@module"] = { fg = C.ochre, style = italics },
		["@label"] = { link = "Label" },

		["@string"] = { link = "String" },
		["@string.documentation"] = { fg = C.aurora },
		["@string.regexp"] = { fg = C.peony },
		["@string.escape"] = { fg = C.peony },
		["@string.special"] = { link = "Special" },
		["@string.special.path"] = { link = "Special" },
		["@string.special.symbol"] = { fg = C.peony },
		["@string.special.url"] = { fg = C.sky },
		["@punctuation.delimiter.regexp"] = { link = "@string.regexp" },

		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Float" },

		["@type"] = { link = "Type" },
		["@type.builtin"] = { link = "Type" },
		["@type.definition"] = { link = "Type" },

		["@attribute"] = { fg = C.lavender },
		["@property"] = { fg = C.sky },

		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		["@function.call"] = { link = "Function" },
		["@function.macro"] = { link = "Function" },

		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "Function" },

		["@constructor"] = { link = "Function" },
		["@operator"] = { link = "Operator" },

		["@keyword"] = { link = "Keyword" },
		["@keyword.modifier"] = { link = "Keyword" },
		["@keyword.type"] = { link = "Keyword" },
		["@keyword.coroutine"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@keyword.operator"] = { fg = C.rust },
		["@keyword.import"] = { link = "Include" },
		["@keyword.repeat"] = { link = "Repeat" },
		["@keyword.return"] = { fg = C.ember },

		["@keyword.conditional"] = { link = "Conditional" },
		["@keyword.conditional.ternary"] = { link = "Operator" },

		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.directive.define"] = { link = "Define" },

		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.bracket"] = { fg = C.subtext1 },
		["@punctuation.special"] = { link = "Special" },

		["@comment"] = { link = "Comment" },
		["@comment.documentation"] = { link = "Comment" },

		["@comment.error"] = { fg = C.root, bg = C.ember },
		["@comment.warning"] = { fg = C.root, bg = C.ochre },
		["@comment.hint"] = { fg = C.root, bg = C.ochre },
		["@comment.todo"] = { fg = C.root, bg = C.lichen },
		["@comment.note"] = { fg = C.root, bg = C.peony },

		["@tag"] = { fg = C.ember },
		["@tag.builtin"] = { fg = C.ember },
		["@tag.attribute"] = { fg = C.rust },
		["@tag.delimiter"] = { fg = C.ember },
	}
end

return M
