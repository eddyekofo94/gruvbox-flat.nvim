local util = require("gruvbox.util")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("gruvbox.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  colors = {
    none = "NONE",
    bg  = "#32302f",
    bg2 = "#282828",
    bg_visual = "#45403d",
    border = "#f2e5bc",
    bg_highlight = "#45403d",
    fg = "#d4be98",
    fg_light = "#ddc7a1",
    fg_dark = "#d4be98",
    comment = "#7c6f64",
    fg_gutter = "#5a524c",
    dark5 = "#5a524c",
    blue = "#7daea3",
    cyan = "#89b482",
    purple = "#d3869b",
    orange = "#e78a4e",
    yellow = "#d8a657",
    yellow2 = "#b47109",
    bg_yellow = "#a96b2c",
    green = "#a9b665",
    red = "#ea6962",
    red1 = "#c14a4a",
    black = "#1d2021",
    git = {
      change = "#4f422e",
      add = "#3b4439",
      delete = "#402120",
      conflict = "#bb7a61",
    },
    gitSigns = { change = "#4f422e", add = "#3b4439", delete = "#402120" },

  }

  util.bg = colors.bg

  colors.diff = {
    add = util.darken(colors.git.add, 0.15),
    delete = util.darken(colors.git.delete, 0.15),
    change = util.darken(colors.git.change, 0.15),
    text = colors.fg_gutter,
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git.ignore = colors.fg_gutter
  colors.black = util.darken(colors.bg, 0.8, "#1d2021")
  colors.border_highlight = colors.blue

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg2
  colors.bg_statusline = colors.bg2

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.darkSidebar and colors.bg2 or colors.bg
  colors.bg_float = config.darkFloat and colors.bg2 or colors.bg

  colors.bg_search = colors.yellow
  colors.fg_search = colors.bg2
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.cyan

  util.color_overrides(colors, config)

  return colors
end

return M
