---@class Neverglade.Highlighter
local M = {}

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
M.generate_theme = function(scheme)
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
	C = scheme
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
	theme = vim.tbl_deep_extend("force", theme, treesitter)

	-- Dynamically load integrations from the config
	for key, value in pairs(O.integrations) do
		if value == true then
			-- We use pcall here to detect failure so we can alert the user if the integration failed to load
			---@type boolean, Neverglade.HighlightGroup
			local success, integration = pcall(require, "neverglade.groups.integrations." .. key)
			if success == true then
				theme = vim.tbl_deep_extend("force", theme, integration.get())
			else
				vim.notify(
					"Failed to load integration " .. key .. ". Please report this as a bug.",
					vim.log.levels.WARN
				)
			end
		end
	end

	theme = apply_table(theme)

	if O.terminal then
		vim.g.terminal_color_0 = C.sapwood
		vim.g.terminal_color_8 = C.sapwood

		vim.g.terminal_color_1 = C.ember
		vim.g.terminal_color_9 = C.ember

		vim.g.terminal_color_2 = C.lichen
		vim.g.terminal_color_10 = C.lichen

		vim.g.terminal_color_3 = C.ochre
		vim.g.terminal_color_11 = C.ochre

		vim.g.terminal_color_4 = C.sky
		vim.g.terminal_color_12 = C.sky

		vim.g.terminal_color_5 = C.lavender
		vim.g.terminal_color_13 = C.lavender

		vim.g.terminal_color_6 = C.aurora
		vim.g.terminal_color_14 = C.aurora

		vim.g.terminal_color_7 = C.text
		vim.g.terminal_color_15 = C.text
	end

	return theme
end

return M
