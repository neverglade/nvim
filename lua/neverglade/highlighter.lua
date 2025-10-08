---@class Neverglade.Highlighter
local M = {}

---@type Neverglade.ColourUtility
local c_util = require("neverglade.color_util")

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

--- Converts a Nevserglade.Highlight into a table to be accepted by nvim_set_hl
---@param highlight Neverglade.Highlight
local function apply_styles(highlight)
	---@type {fg: string, bg: string, [Neverglade.HighlightArgs]: boolean?, sp: string}
	local hl = {
		fg = highlight.fg,
		bg = highlight.bg,
		link = highlight.link,
	}

	if highlight.style then
		for _, style in pairs(highlight.style) do
			hl[style] = true
		end
	end

	if highlight.sp then
		hl["sp"] = highlight.sp
	end
	return hl
end

--- Converts a table of highlights into a table of highlights for use in nvim_set_hl
---@param t Neverglade.Highlights
---@return {fg: string, bg: string, [Styles]: boolean?, sp?: string}
local function apply_table(t)
	local ret = {}
	for g, hl in pairs(t) do
		ret[g] = apply_styles(hl)
	end

	return ret
end

---Generates the various highlight groups for this colour scheme to be used by Neovim.
M.generate_theme = function(s, options)
	---@enum Styles
	S = {
		bold = "bold",
		italic = "italic",
		reverse = "reverse",
		undercurl = "undercurl",
		underline = "underline",
		standout = "standout",
		strikethrough = "strikethrough",
		nocombine = "nocombine",
	}

	O = require("neverglade").config
	C = require("neverglade.colors").generate_scheme(O, O.variety)
	U = require("neverglade.color_util")

	local optional_italics = { S.italic }
	local comment_italics = { S.italic }

	--- This could be done more compactly with dynamic requires, but I prefer
	--- the simplicity of directly requiring each group for now
	local theme = {}

	local editor = require("neverglade.groups.editor").get()
	theme = vim.tbl_deep_extend("force", theme, editor)

	local syntax = require("neverglade.groups.syntax").get()
	theme = vim.tbl_deep_extend("force", theme, syntax)

	local lsp = require("neverglade.groups.lsp").get()
	theme = vim.tbl_deep_extend("force", theme, lsp)

	local treesitter = require("neverglade.groups.treesitter").get()
	theme = vim.tbl_deep_extend("force", theme, lsp)

	theme = apply_table(theme)

	---@type Neverglade.Highlights
	local syntax = {
		--- DiffAdd, DiffChange, DiffDelete, DiffText

		--- Syntax

		Text = syntax_entry(s.text, s.none),
		Gray = syntax_entry(s.gray1, s.none),
		Ember = syntax_entry(s.ember, s.none),
		Rust = syntax_entry(s.rust, s.none),
		Ochre = syntax_entry(s.ochre, s.none),
		Lichen = syntax_entry(s.lichen, s.none),
		Moss = syntax_entry(s.moss, s.none),
		Aurora = syntax_entry(s.aurora, s.none),
		Peony = syntax_entry(s.peony, s.none),
		Sky = syntax_entry(s.sky, s.none),
		Lavender = syntax_entry(s.lavender, s.none),
		Gray2 = syntax_entry(s.gray2, s.none),
		Gray1 = syntax_entry(s.gray1, s.none),
		Gray0 = syntax_entry(s.gray0, s.none),

		--- Treesitter
		["@variable"] = { link = "Text" },
		["@variable.builtin"] = { link = "LavenderItalic" },
		["@variable.parameter"] = { link = "Text" },
		["@variable.member"] = { link = "aurora" },

		["@constant"] = { link = "Aurora" },
		["@constant.builtin"] = { link = "LavenderItalic" },
		["@constant.macro"] = { link = "LavenderItalic" },

		["@module"] = { link = "OchreItalic" },
		["@label"] = { link = "Rust" },

		["@string"] = { link = "String" },
	}

	if O.terminal then
		vim.g.terminal_color_0 = s.sapwood
		vim.g.terminal_color_8 = s.sapwood

		vim.g.terminal_color_1 = s.ember
		vim.g.terminal_color_9 = s.ember

		vim.g.terminal_color_2 = s.lichen
		vim.g.terminal_color_10 = s.lichen

		vim.g.terminal_color_3 = s.ochre
		vim.g.terminal_color_11 = s.ochre

		vim.g.terminal_color_4 = s.sky
		vim.g.terminal_color_12 = s.sky

		vim.g.terminal_color_5 = s.lavender
		vim.g.terminal_color_13 = s.lavender

		vim.g.terminal_color_6 = s.aurora
		vim.g.terminal_color_14 = s.aurora

		vim.g.terminal_color_7 = s.text
		vim.g.terminal_color_15 = s.text
	end

	return theme
end

return M
