-- Shale color palette
-- Dark stone backgrounds with muted mineral and woodland accent colors
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
  fg       = "#d6e0d8", -- pale mist
  fg_dim   = "#8a9e91", -- lichen gray
  comment  = "#5c7265", -- rain-washed green gray

  -- Syntax Accent Colors
  keyword  = "#c97fa0", -- muted rose
  string   = "#a8c97f", -- soft moss
  func     = "#7fb4c9", -- mineral blue
  type     = "#d4a96a", -- weathered ochre
  constant = "#9ed490", -- fern green
  number   = "#e8956d", -- warm clay
  operator = "#b0c9be", -- pale silver green

  -- UI Accents
  selection   = "#2e3a4a", -- muted blue-gray selection
  cursorline  = "#26262a", -- subtle gray cursorline
  git_add     = "#6aab78", -- fresh green
  git_change  = "#c9a84c", -- muted gold
  git_delete  = "#b05e5e", -- weathered red
  error       = "#cc6666", -- ember red
  warning     = "#d4a96a", -- weathered ochre
  hint        = "#7fb4c9", -- mineral blue

  -- Treesitter-specific semantic colors
  param  = "#c9b97f", -- dusty gold for fn parameters / fn args
  member = "#9ec4d4", -- pale blue for field/property access

  -- Extras
  info        = "#a8c97f", -- soft moss (same as string)

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
