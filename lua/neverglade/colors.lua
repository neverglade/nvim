---@class Neverglade.Colors
local M = {}

---@type Neverglade.SchemeBackgrounds
local hard_background = {
	dark = {
		earth = "#1E2326",
		root = "#272E33",
		heartwood = "#2E383C",
		sapwood = "#374145",
		bark = "#414B50",
		branch = "#495156",
		leaf = "#4F5B58",
	},
	light = {
		earth = "#FFFBEF",
		root = "#F8F5E4",
		heartwood = "#EFEBD7",
		sapwood = "#EAE6CC",
		bark = "#DED8BA",
		branch = "#D2CCAD",
		leaf = "#B5BDA8",
	},
}

---@type table<Neverglade.Backgrounds, Neverglade.SchemeBase>
local base_scheme = {
	dark = {
		text = "#D3C6AA",
		subtext1 = "#B2A996",
		subtext0 = "#837C6D",
		lichen = "#A7C080",
		moss = "#83C092",
		ember = "#E67E80",
		rust = "#E69875",
		ochre = "#DBBC7F",
		aurora = "#7FBBB3",
		peony = "#D699B6",
		lavender = "#B6AFF3",
		sky = "#85B1F8",
		none = "NONE",
	},
	light = {
		text = "#546168",
		subtext1 = "#67767F",
		subtext0 = "#809598",
		lichen = "#98AC0C",
		moss = "#3CAF83",
		ember = "#F85552",
		rust = "#F57D26",
		ochre = "#DFA000",
		aurora = "#53C6C2",
		peony = "#DF69BA",
		lavender = "#9990EF",
		sky = "#3A94C5",
		none = "NONE",
	},
}

M.generate_scheme = function(options, theme)
	local background_style = options.background or "medium"
	local base = base_scheme[theme]

	---@type Neverglade.SchemeBackground
	local backround

	if background_style == "hard" then
		backround = hard_background[theme]
	else
		backround = hard_background[theme]
	end

	---@type Neverglade.Scheme
	local combined = vim.tbl_extend("force", base, backround)

	return combined
end

return M
