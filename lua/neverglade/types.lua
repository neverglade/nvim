---@class Neverglade
---@field config Neverglade.Config
---@field setup fun(opts: Neverglade.SetupOptions)
---@field load fun()

---@class Neverglade.Config
---@field variety string
---@field transparent_background? 0 | 1 | 2
---@field italics boolean
---@field italic_comments boolean
---@field show_eob boolean

---@class Neverglade.SetupOptions
---@field variety? string
---@field transparent_background? 0 | 1 | 2
---@field italics? boolean
---@field italic_comments? boolean
---@field show_eob? boolean

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
---@field none string

---@class Neverglade.Scheme: Neverglade.SchemeBase, Neverglade.SchemeBackground

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

---@class Neverglade.Highlighter
---@field generate_syntax fun(scheme: Neverglade.Scheme, options: Neverglade.Config): Neverglade.Highlights

---@class Neverglade.Colors
---@field generate_scheme fun(options: Neverglade.Config, theme: Neverglade.Backgrounds): Neverglade.Scheme

---@class Neverglade.ColourUtility
---@field blend fun(foreground: string, alpha: string|number, background: string): string
---@field blend_bg fun(hex: string, amount: string|number, bg: string?): string
---@field darken fun(hex: string, amount: string|number, bg: string?): string
---@field blend_fg fun(hex: string, amount: string|number, bg: string?): string
---@field lighten fun(hex: string, amount: string|number, bg: string?): string
