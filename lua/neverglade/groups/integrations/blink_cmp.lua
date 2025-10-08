---@class Neverglade.HighlightGroup
local M = {}

function M.get()
	return {
		BlinkCmpLabel = { fg = C.subtext1 },
		BlinkCmpLabelDeprecated = { fg = C.subtext1, style = { S.strikethrough } },
		BlinkCmpKind = { fg = C.text },
		BlinkCmpMenu = { link = "Pmenu" },
		BlinkCmpDoc = { link = "NormalFloat" },
		BlinkCmpDocBorder = { link = "NormalFloat" },
		BlinkCmpDocSeparator = { fg = C.lichen },
		BlinkCmpLabelMatch = { fg = C.text, style = { S.bold } },
		BlinkCmpMenuSelection = { bg = C.lichen, fg = C.heartwood, style = { S.bold } },
		BlinkCmpScrollBarGutter = { bg = C.leaf },
		BlinkCmpScrollBarThumb = { bg = C.gray2 },
	}
end

return M
