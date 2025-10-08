---@type Neverglade.Colors
local colors = require("neverglade.colors")
---@type Neverglade.Highlights
local highlighter = require("neverglade.highlighter")
---@type Neverglade.Util
local util = require("neverglade.util")

---@class Neverglade
local M = {
	---@type Neverglade.Options
	default_config = {
		--- Controls how
		variety = "oak",
		transparent_background = false,
		italics = true,
		italic_comments = true,

		show_eob = false,
		diagnostics = {
			text = false,
			virtual = "colored",
		},
		terminal = true,
	},
}

M.config = M.default_config

M.setup = function(opts)
	M.config = vim.tbl_extend("keep", opts or {}, M.default_config)
end

M.load = function()
	local scheme = colors.generate_scheme(M.config, M.config.variety)
	local generated_syntax = highlighter.generate_theme(scheme, M.config)

	util.load(generated_syntax)
end

M.colorscheme = M.load

return M
