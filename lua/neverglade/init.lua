---@type Neverglade.Colors
local colors = require("neverglade.colors")

---@class Neverglade
local M = {
	---@type Neverglade.Config
	default_config = {
		--- Controls the hardness of the background. "soft", "medium", or "hard"
		background = "hard",
		--- Controls how
		transparent_background = 2,
		italics = true,
		italic_comments = true,
	},
}

M.config = M.default_config

M.setup = function(opts)
	M.config = vim.tbl_extend("keep", opts or {}, M.default_config)
end

M.load = function()
	local scheme = colors.generate_scheme(M.config, vim.o.background)
end

M.colorscheme = M.load

return M
