---@class Neverglade.HighlightGroup
local M = {}

function M.get()
	local active_bg = O.transparent_background and C.none or C.heartwood
	local inactive_bg = O.transparent_background and C.none or C.root

	return {
		NeoTreeDirectoryName = { fg = C.lichen },
		NeoTreeDirectoryIcon = { fg = C.lichen },
		NeoTreeNormal = { fg = C.text, bg = active_bg },
		NeoTreeNormalNC = { fg = C.text, bg = active_bg },
		NeoTreeExpander = { fg = C.leaf },
		NeoTreeIndentMarker = { fg = C.leaf },
		NeoTreeRootName = { fg = C.lichen },
		NeoTreeSymbolicLinkTarget = { fg = C.peony },
		NeoTreeModified = { link = "Changed" },

		NeoTreeFloatBorder = { link = "FloatBorder" },
		NeoTreeFloatTitle = { link = "FloatTitle" },
		NeoTreeTitleBar = { fg = C.heartwood, bg = C.lichen },
		NeoTreeDimText = { fg = C.subtext1 },

		NeoTreeGitAdded = { fg = C.moss },
		NeoTreeGitConflict = { fg = C.ember },
		NeoTreeGitDeleted = { fg = C.ember },
		NeoTreeGitIgnored = { fg = C.subtext1 },
		NeoTreeGitModified = { fg = C.aurora },
		NeoTreeGitUnstaged = { fg = C.rust },
		NeoTreeGitUntracked = { fg = C.sky },
		NeoTreeGitStaged = { fg = C.moss },

		NeoTreeVertSplit = { fg = C.leaf, bg = C.heartwood },
		NeoTreeWinSeparator = {
			fg = C.leaf,
			bg = O.transparent_background and C.none or C.heartwood,
		},
	}
end

return M
