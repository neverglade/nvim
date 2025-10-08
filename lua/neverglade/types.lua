---@class Neverglade
---@field config Neverglade.Options
---@field setup fun(opts: Neverglade.Options)
---@field load fun()

---@alias Neverglade.Variety "ebony" | "oak" | "birch"

---@class Neverglade.Options
---@field variety Neverglade.Variety?
---@field transparent_background? boolean
---@field italics boolean?
---@field italic_comments boolean?
---@field show_eob boolean?
---@field diagnostics Neverglade.Diagnostics?
---@field terminal boolean?

---@class Neverglade.Diagnostics
---@field text boolean
---@field virtual "colored" | "gray"

---@class Neverglade.SchemeBackground
---@field earth string
---@field root string
---@field heartwood string
---@field sapwood string
---@field bark string
---@field branch string
---@field leaf string

---@class Neverglade.SchemeBase
---@field text string
---@field subtext1 string
---@field subtext0 string
---@field gray2 string
---@field gray1 string
---@field gray0 string
---@field lichen string
---@field moss string
---@field ochre string
---@field aurora string
---@field peony string
---@field lavender string
---@field sky string
---@field ember string
---@field rust string

---@class Neverglade.Scheme: Neverglade.SchemeBase, Neverglade.SchemeBackground, {none: string}

---@alias Neverglade.Backgrounds "ebony" | "oak" | "birch"
---@alias Neverglade.SchemeBackgrounds table<Neverglade.Backgrounds, Neverglade.SchemeBackground>

---@alias Neverglade.HighlightArgs "bold" | "underline" | "undercurl" | "underdouble" | "underdotted" | "underdashed" | "strikethrough" | "reverse" | "inverse" | "italic" | "standout" | "altfont" | "nocombine" | "NONE"

---@class Neverglade.Highlight
---@field fg string?
---@field bg string?
---@field style Neverglade.HighlightArgs[]?
---@field link string

---@alias Neverglade.Highlights table<string, Neverglade.Highlight>

---@class Neverglade.Util
---@field generate_highlight fun(group: string, hl: Neverglade.Highlight)
---@field generate_highlights fun(syntax_entries: Neverglade.Highlights)
---@field load fun(generated_syntax: Neverglade.Highlights)

---@class Neverglade.HighlightGroup
---@field get fun(): Neverglade.Highlights

---@class Neverglade.Highlighter
---@field generate_theme fun(scheme: Neverglade.Scheme, options: Neverglade.Options): Neverglade.Highlights

---@class Neverglade.Colors
---@field generate_scheme fun(options: Neverglade.Options, theme: Neverglade.Backgrounds): Neverglade.Scheme

---@class Neverglade.ColourUtility
---@field blend fun(foreground: string, alpha: string|number, background: string): string
---@field blend_bg fun(hex: string, amount: string|number, bg: string?): string
---@field darken fun(hex: string, amount: string|number, bg: string?): string
---@field blend_fg fun(hex: string, amount: string|number, bg: string?): string
---@field lighten fun(hex: string, amount: string|number, bg: string?): string
