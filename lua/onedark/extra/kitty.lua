local util = require("onedark.util")

local M = {}

function M.kitty(config)
  config = config or require("onedark.config")
  config.transform_colors = true
  local colors = require("onedark.colors").setup(config)

  local kitty = util.template(
    [[
  # onedark colors for Kitty
  
  background ${bg}
  foreground ${fg}
  selection_background ${bg_visual}
  selection_foreground ${fg}
  url_color ${green}
  cursor ${fg}
  
  # Tabs
  active_tab_background ${bg}
  active_tab_foreground ${fg}
  inactive_tab_background ${bg_highlight}
  inactive_tab_foreground ${fg_gutter}
  #tab_bar_background ${black}
  
  # normal
  color0 ${black}
  color1 ${red}
  color2 ${green}
  color3 ${yellow}
  color4 ${blue}
  color5 ${purple}
  color6 ${cyan}
  color7 ${fg_dark}
  
  # bright
  color8 ${fg_gutter}
  color9 ${red}
  color10 ${green}
  color11 ${yellow}
  color12 ${blue}
  color13 ${purple}
  color14 ${cyan}
  color15 ${fg}
  
  # extended colors
  color16 ${orange}
  color17 ${red1}
  ]],
    colors
  )
  return kitty
end

return M
