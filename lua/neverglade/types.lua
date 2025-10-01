---@class Neverglade
---@field config Neverglade.Config
---@field setup fun(opts: Neverglade.SetupOptions)
---@field load fun()

---@class Neverglade.Config
---@field background "soft" | "medium" | "hard"
---@field italics? boolean

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
---@field lichen string
---@field moss string
---@field ochre string
---@field aurora string
---@field peony string
---@field lavender string
---@field sky string
---@field ember string
---@field rust string

---@class Neverglade.Scheme: Neverglade.SchemeBase, Neverglade.SchemeBackground

---@alias Neverglade.Backgrounds "light" | "dark"
---@alias Neverglade.SchemeBackgrounds table<Neverglade.Backgrounds, Neverglade.SchemeBackground>

---@class Neverglade.Colors
---@field generate_scheme fun(options: Neverglade.Config, theme: "dark" | "light"): Neverglade.Scheme
