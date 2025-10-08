---@class Neverglade.HighlightGroup
local M = {}

function M.get()
	local bg = O.transparent_background and C.none or C.root
	local fg = O.transparent_background and C.lichen or C.none

	local secondary_bg = O.transparent_background and C.none or C.lichen
	local secondary_fg = O.transparent_background and C.lichen or C.root

	local muted_bg = O.transparent_background and C.none or C.gray1
	local muted_fg = O.transparent_background and C.gray1 or C.root

	return {
		MasonHeader = { fg = fg, bg = bg, style = { S.bold } },
		MasonHeaderSecondary = { fg = secondary_fg, bg = secondary_bg, style = { S.bold } },

		MasonHighlight = { fg = C.lichen },
		MasonHighlightBlock = {
			bg = O.transparent_background and C.none or C.lichen,
			fg = O.transparent_background and C.lichen or C.sapwood,
		},
		MasonHighlightBlockBold = { bg = secondary_bg, fg = secondary_fg, style = { S.bold } },

		MasonHighlightSecondary = { fg = C.lichen },
		MasonHighlightBlockSecondary = { fg = secondary_fg, bg = secondary_bg },
		MasonHighlightBlockBoldSecondary = { fg = fg, bg = bg, style = { S.bold } },

		MasonMuted = { fg = C.gray1 },
		MasonMutedBlock = { bg = muted_bg, fg = muted_fg },
		MasonMutedBlockBold = { bg = muted_bg, fg = muted_fg, style = { S.bold } },

		MasonError = { fg = C.ember },

		MasonHeading = { fg = C.lichen, style = { S.bold } },
	}
end

return M
