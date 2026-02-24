-- Shale color palette
-- Dark stone backgrounds with hill station accent colors
--
-- Every color is an explicit #RRGGBB hex value.  All highlight groups
-- reference this table so the scheme is deterministic and independent
-- of terminal palette, $TERM, or OS.

---@class ShaleColors
local colors = {
  -- Base / Background Tones
  bg       = "#1c1c1e", -- muted dark gray
  bg_alt   = "#222224", -- slightly lighter gray
  surface  = "#282829", -- surface gray
  border   = "#4a4a4f", -- border gray

  -- Foreground / Text
  fg       = "#d6e0d8", -- Mist White: morning fog diffused light
  fg_dim   = "#8a9e91", -- Lichen Grey: lichen on old stone
  comment  = "#5c7265", -- Drizzle: light rain on leaves

  -- Syntax Accent Colors
  keyword  = "#c97fa0", -- Rhododendron: pink Himalayan blooms
  string   = "#a8c97f", -- Cardamom: fresh cardamom leaf
  func     = "#7fb4c9", -- Nilgiri Blue: blue mountains haze
  type     = "#d4a96a", -- Saffron Fog: warm lamp in hill mist
  constant = "#9ed490", -- Fern Tip: bright new fern growth
  number   = "#e8956d", -- Sunset Ridge: ochre hillside at dusk
  operator = "#b0c9be", -- Cloud Break: silver lining

  -- UI Accents
  selection   = "#2e3a4a", -- muted blue-gray selection
  cursorline  = "#26262a", -- subtle gray cursorline
  git_add     = "#6aab78", -- New Shoot
  git_change  = "#c9a84c", -- Monsoon Gold
  git_delete  = "#b05e5e", -- Red Laterite: Kerala red soil
  error       = "#cc6666", -- Ember
  warning     = "#d4a96a", -- Saffron Fog
  hint        = "#7fb4c9", -- Nilgiri Blue

  -- Treesitter-specific semantic colors
  param  = "#c9b97f", -- Dusty Gold: fn parameters / fn args — warm, distinct from fg
  member = "#9ec4d4", -- Pale Nilgiri: field/property access — cooler blue-white than func

  -- Extras
  info        = "#a8c97f", -- Cardamom (same as string)

  -- Diff / Git background tints (muted overlays)
  diff_add_bg    = "#1a2b1e", -- subtle green tint
  diff_change_bg = "#26231a", -- subtle gold tint
  diff_delete_bg = "#2b1a1a", -- subtle red tint

  -- Render-markdown heading backgrounds
  md_h1_bg = "#231b20", -- muted rose
  md_h2_bg = "#1a1e23", -- muted slate
  md_h3_bg = "#1e1e1a", -- muted olive
  md_h4_bg = "#1a2018", -- muted fern
}

return colors
