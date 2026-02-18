-- Shale color palette
-- Dark stone backgrounds with hill station accent colors

---@class ShaleColors
local colors = {
  -- Base / Background Tones
  bg = "#1c1c1e", -- muted dark gray
  bg_alt = "#222224", -- slightly lighter gray
  surface = "#282829", -- surface gray
  border = "#323234", -- border gray

  -- Foreground / Text
  fg = "#d6e0d8", -- Mist White: morning fog diffused light
  fg_dim = "#8a9e91", -- Lichen Grey: lichen on old stone
  comment = "#5c7265", -- Drizzle: light rain on leaves

  -- Syntax Accent Colors
  keyword = "#c97fa0", -- Rhododendron: pink Himalayan blooms
  string = "#a8c97f", -- Cardamom: fresh cardamom leaf
  func = "#7fb4c9", -- Nilgiri Blue: blue mountains haze
  type = "#d4a96a", -- Saffron Fog: warm lamp in hill mist
  constant = "#9ed490", -- Fern Tip: bright new fern growth
  number = "#e8956d", -- Sunset Ridge: ochre hillside at dusk
  operator = "#b0c9be", -- Cloud Break: silver lining

  -- UI Accents
  selection = "#2e3a4a", -- muted blue-gray selection
  cursorline = "#26262a", -- subtle gray cursorline
  git_add = "#6aab78", -- New Shoot
  git_change = "#c9a84c", -- Monsoon Gold
  git_delete = "#b05e5e", -- Red Laterite: Kerala red soil
  error = "#cc6666", -- Ember
  warning = "#d4a96a", -- Saffron Fog
  hint = "#7fb4c9", -- Nilgiri Blue

  -- Treesitter-specific semantic colors
  param = "#c9b97f", -- Dusty Gold: fn parameters / fn args — warm, distinct from fg
  member = "#9ec4d4", -- Pale Nilgiri: field/property access — cooler blue-white than func

  -- Extras derived from palette
  info = "#a8c97f", -- Cardamom
  none = "NONE",
}

return colors
