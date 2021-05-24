local config = require("onedark.config")
local colors = require("onedark.colors").setup(config)

local onedark = {}

onedark.normal = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.green },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

onedark.insert = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.blue },
}

onedark.command = {
  a = { bg = colors.purple, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.purple },
}

onedark.visual = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.yellow },
}

onedark.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.fg_gutter, fg = colors.red },
}

onedark.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

return onedark
