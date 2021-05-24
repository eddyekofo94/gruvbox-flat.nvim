local util = require("onedark.util")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("onedark.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  local gruvbox = {
    bg0 = "#282828",
    bg1 = "#32302f", -- cursor color
    bg2 = "#32302f",
    bg3 = "#45403d",
    bg4 = "#45403d",
    bg5 = "#5a524c",
    bg_statusline1 = "#32302f",
    bg_statusline2 = "#3a3735",
    bg_statusline3 = "#504945",
    bg_diff_green = "#34381b",
    bg_visual_green = "#3b4439",
    bg_diff_red = "#402120",
    bg_visual_red = "#4c3432",
    fg0 = "#d4be98",
    fg1 = "#ddc7a1",
    red = "#ea6962",
    orange = "#e78a4e",
    yellow = "#d8a657",
    green = "#a9b665",
    aqua = "#89b482",
    blue = "#7daea3",
    purple = "#d3869b",
    bg_red = "#ea6962",
    bg_green = "#a9b665",
    bg_yellow = "#d8a657",
    grey0 = "#7c6f64",
    grey1 = "#928374",
    grey2 = "#a89984",
    white = "#f2e5bc",
    black = "#1d2021",
    none = "NONE",
    cyan = "#7daea3",
    pink = "#d3869b",
    link = "#89b482",
    cursor = "#ddc7a1",
  }

  colors = {
    none = "NONE",
    bg = gruvbox.bg0,
    bg2 = gruvbox.bg1,
    bg_visual = gruvbox.bg_visual,
    border = gruvbox.white,
    bg_highlight = gruvbox.bg2,
    fg = gruvbox.fg0,
    fg_light = gruvbox.fg1,
    fg_dark = gruvbox.grey1,
    fg_gutter = gruvbox.grey2,
    dark5 = gruvbox.bg5,
    blue = gruvbox.blue,
    cyan = gruvbox.aqua,
    purple = gruvbox.purple,
    orange = gruvbox.orange,
    yellow = gruvbox.yellow,
    yellow2 = gruvbox.yellow, -- TODO: look for another yellow on the pallet
    bg_yellow = gruvbox.bg_yellow,
    green = gruvbox.green,
    red = gruvbox.red,
    red1 = gruvbox.bg_red, -- TODO: maybe look for another red
    git = {
      change = gruvbox.bg_diff_blue,
      add = gruvbox.bg_diff_green,
      delete = gruvbox.bg_diff_red,
      conflict = "#bb7a61", -- TODO: find a different color maybe?
    },
    gitSigns = {
      change = gruvbox.bg_diff_blue,
      add = gruvbox.bg_diff_green,
      delete = gruvbox.bg_diff_red,
    },

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
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.blue

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg2
  colors.bg_statusline = colors.bg2

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.darkSidebar and colors.bg2 or colors.bg
  colors.bg_float = config.darkFloat and colors.bg2 or colors.bg

  colors.bg_search = colors.bg_yellow
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
