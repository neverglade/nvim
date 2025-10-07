---@class Neverglade.Colors
local M = {}

---@type Neverglade.SchemeBackgrounds
local background_scheme = {
	ebony = {
		earth = "#1E2326",
		root = "#272E33",
		heartwood = "#2E383C",
		sapwood = "#374145",
		bark = "#414B50",
		branch = "#495156",
		leaf = "#4F5B58",
	},
	birch = {
		earth = "#F7F3DF",
		root = "#EEE9D3",
		heartwood = "#EAE6CC",
		sapwood = "#E0DABD",
		bark = "#D5D0B3",
		branch = "#D0CAA9",
		leaf = "#AEB79F",
	},
}

---@type table<Neverglade.Backgrounds, Neverglade.SchemeBase>
local base_scheme = {
	ebony = {
		text = "#D3C6AA",
		subtext1 = "#B2A996",
		subtext0 = "#837C6D",
		gray2 = "#7A8478",
		gray1 = "#859289",
		gray0 = "#9DA9A0",
		lichen = "#A7C080",
		moss = "#83C092",
		ember = "#E67E80",
		rust = "#E69875",
		ochre = "#DBBC7F",
		aurora = "#7FBBB3",
		peony = "#D699B6",
		lavender = "#B6AFF3",
		sky = "#75ABBD",
		none = "NONE",
	},
	birch = {
		text = "#546168",
		subtext1 = "#67767F",
		subtext0 = "#809598",
		gray2 = "#A6B0A0",
		gray1 = "#939F91",
		gray0 = "#64787D",
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
	local base = base_scheme[theme]

	---@type Neverglade.SchemeBackground
	local background
	background = background_scheme[theme]

	---@type Neverglade.Scheme
	local combined = vim.tbl_extend("force", base, background)

	return combined
end

return M
