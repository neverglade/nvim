---@class Neverglade.HighlightGroup
local M = {}

function M.get()
	return {
		WhichKey = { link = "NormalFloat" },
		WhichKeyBorder = { link = "FloatBorder" },

		WhichKeyGroup = { fg = C.lichen },
		WhichKeySeparator = { fg = C.subtext0 },
		WhichKeyDesc = { fg = C.text },
		WhichKeyValue = { fg = C.moss },
	}
end

return M
