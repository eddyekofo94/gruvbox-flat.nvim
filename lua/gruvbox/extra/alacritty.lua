local util = require("gruvbox.util")

local M = {}

function M.alacritty(config)
  config = config or require("gruvbox.config")
  config.transform_colors = true
  local colors = require("gruvbox.colors").setup(config)

  local alacrittyColors = {}
  for k, v in pairs(colors) do
    if type(v) == "string" then
      alacrittyColors[k] = v:gsub("^#", "0x")
    end
  end

  local alacritty = util.template(
    [[
# gruvbox Alacritty Colors
colors:
  # Default colors
  primary:
    background: '${bg}'
    foreground: '${fg}'

  # Normal colors
  normal:
    black:   '${black}'
    red:     '${red}'
    green:   '${green}'
    yellow:  '${yellow}'
    blue:    '${blue}'
    magenta: '${purple}'
    aqua:    '${aqua}'
    white:   '${fg_dark}'

  # Bright colors
  bright:
    black:   '${bg2}'
    red:     '${red}'
    green:   '${green}'
    yellow:  '${yellow}'
    blue:    '${blue}'
    magenta: '${purple}'
    aqua:    '${aqua}'
    white:   '${fg}'

  indexed_colors:
    - { index: 16, color: '${orange}' }
    - { index: 17, color: '${red1}' }

  ]],
    alacrittyColors
  )

  return alacritty
end

return M
