-- shale.nvim
-- A Neovim colorscheme: dark stone backgrounds, hill station accent palette

local M = {}

---@class ShaleConfig
---@field transparent boolean Use transparent background
---@field italic_comments boolean Italicize comments (default: true)
---@field italic_keywords boolean Italicize keywords (default: true)
local defaults = {
  transparent = false,
  italic_comments = true,
  italic_keywords = true,
}

---@type ShaleConfig
M.config = vim.deepcopy(defaults)

---@param opts ShaleConfig?
M.setup = function(opts)
  M.config = vim.tbl_deep_extend("force", defaults, opts or {})
end

M.load = function()
  if vim.version().minor < 8 then
    vim.notify("shale.nvim requires Neovim >= 0.8", vim.log.levels.ERROR)
    return
  end

  -- Reset highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "shale"

  -- Apply all highlight groups
  require("shale.highlights").setup()

  -- Handle transparent background
  if M.config.transparent then
    local transparent_groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "SignColumn",
      "StatusLine",
      "StatusLineNC",
      "TabLine",
      "TabLineFill",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
    }
    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  end

  -- Disable italics if configured
  if not M.config.italic_comments then
    vim.api.nvim_set_hl(0, "Comment", { fg = require("shale.colors").comment })
    vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
  end

  if not M.config.italic_keywords then
    local c = require("shale.colors")
    vim.api.nvim_set_hl(0, "@keyword.function", { fg = c.keyword })
    vim.api.nvim_set_hl(0, "@keyword.return", { fg = c.keyword })
    vim.api.nvim_set_hl(0, "@variable.builtin", { fg = c.constant })
    vim.api.nvim_set_hl(0, "@constant.builtin", { fg = c.constant })
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = c.type })
    vim.api.nvim_set_hl(0, "@module.builtin", { fg = c.type })
    vim.api.nvim_set_hl(0, "@function.builtin", { fg = c.func })
  end
end

--- Returns the lualine theme table for use with lualine.nvim
---@return table
M.lualine = function()
  local c = require("shale.colors")
  local lualine_theme = {
    normal = {
      a = { fg = c.bg, bg = c.func, gui = "bold" },
      b = { fg = c.fg, bg = c.surface },
      c = { fg = c.fg_dim, bg = c.bg_alt },
    },
    insert = {
      a = { fg = c.bg, bg = c.string, gui = "bold" },
      b = { fg = c.fg, bg = c.surface },
      c = { fg = c.fg_dim, bg = c.bg_alt },
    },
    visual = {
      a = { fg = c.bg, bg = c.keyword, gui = "bold" },
      b = { fg = c.fg, bg = c.surface },
      c = { fg = c.fg_dim, bg = c.bg_alt },
    },
    replace = {
      a = { fg = c.bg, bg = c.number, gui = "bold" },
      b = { fg = c.fg, bg = c.surface },
      c = { fg = c.fg_dim, bg = c.bg_alt },
    },
    command = {
      a = { fg = c.bg, bg = c.type, gui = "bold" },
      b = { fg = c.fg, bg = c.surface },
      c = { fg = c.fg_dim, bg = c.bg_alt },
    },
    inactive = {
      a = { fg = c.fg_dim, bg = c.bg_alt },
      b = { fg = c.fg_dim, bg = c.bg_alt },
      c = { fg = c.fg_dim, bg = c.bg_alt },
    },
  }
  return lualine_theme
end

return M
