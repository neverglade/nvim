return function(variety)
	local O = require("neverglade").config
	local F = variety or O.variety or "oak"
	local C = require("neverglade.colors").generate_scheme(O, F)

	local neverglade = {}

	local transparent_bg = O.transparent_background == 2 and C.none or C.heartwood

	neverglade.normal = {
		a = { bg = C.lichen, fg = C.root, gui = "bold" },
		b = { bg = C.bark, fg = C.text },
		c = { bg = C.heartwood, fg = C.text },
	}

	neverglade.insert = {
		a = { bg = C.text, fg = C.root, gui = "bold" },
		b = { bg = C.bark, fg = C.text },
		c = { bg = C.heartwood, fg = C.text },
	}

	neverglade.visual = {
		a = { bg = C.moss, fg = C.root, gui = "bold" },
		b = { bg = C.bark, fg = C.text },
		c = { bg = C.heartwood, fg = C.text },
	}

	neverglade.replace = {
		a = { bg = C.rust, fg = C.root, gui = "bold" },
		b = { bg = C.bark, fg = C.text },
		c = { bg = C.heartwood, fg = C.text },
	}

	neverglade.command = {
		a = { bg = C.aurora, fg = C.root, gui = "bold" },
		b = { bg = C.bark, fg = C.text },
		c = { bg = C.heartwood, fg = C.text },
	}

	neverglade.terminal = {
		a = { bg = C.lavender, fg = C.root, gui = "bold" },
		b = { bg = C.bark, fg = C.text },
		c = { bg = C.heartwood, fg = C.text },
	}

	neverglade.inactive = {
		a = { bg = C.root, fg = C.gray1, gui = "bold" },
		b = { bg = C.root, fg = C.gray1 },
		c = { bg = C.root, fg = C.gray1 },
	}

	return neverglade
end
