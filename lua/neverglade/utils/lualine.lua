return function(flavour)
	local F = flavour or "ebony"
	local O = require("neverglade").config
	local C = require("neverglade.colors").generate_scheme(O, F)

	local neverglade = {}

	local transparent_bg = O.transparent_background == 2 and C.none or C.heartwood

	neverglade.normal = {
		a = { bg = C.lichen, fg = C.root, gui = "bold" },
		b = { bg = C.bark, fg = C.gray2 },
		c = { bg = C.heartwood, fg = C.gray1 },
	}

	neverglade.insert = {
		a = { bg = C.text, fg = C.root, gui = "bold" },
		b = { bg = C.bark, fg = C.text },
		c = { bg = C.heartwood, fg = C.text },
	}

	neverglade.command = {
		a = { bg = C.aurora, fg = C.root, gui = "bold" },
		b = { bg = C.bark, fg = C.text },
		c = { bg = C.heartwood, fg = C.text },
	}

	return neverglade
end
