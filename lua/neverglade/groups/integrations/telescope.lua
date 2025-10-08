---@class Neverglade.HighlightGroup
local M = {}

function M.get()
	return {
		TelescopeBorder = { link = "FloatBorder" },
		TelescopeNormal = { link = "NormalFloat" },
		TelescopePreviewNormal = { link = "TelescopeNormal" },
		TelescopePromptNormal = { link = "TelescopeNormal" },
		TelescopeResultsNormal = { link = "TelescopeNormal" },
		TelescopeTitle = { link = "FloatTitle" },
		TelescopeSelectionCaret = { fg = C.moss, bg = C.heartwood },
		TelescopeSelection = { fg = C.lichen, bg = C.heartwood },
		TelescopeMatching = { fg = C.aurora },
		TelescopePromptPrefix = { fg = C.moss },
	}
end

return M
