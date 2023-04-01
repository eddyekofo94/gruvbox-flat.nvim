local hsluv = require("gruvbox.hsluv")

local util = {}

util.colorsUsed = {}
util.colorCache = {}

util.bg = "#000000"
util.fg = "#ffffff"

local function hexToRgb(hex_str)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

  local r, g, b = string.match(hex_str, pat)
  return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function util.blend(fg, bg, alpha)
  bg = hexToRgb(bg)
  fg = hexToRgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function util.darken(hex, amount, bg) return util.blend(hex, bg or util.bg, math.abs(amount)) end
function util.lighten(hex, amount, fg) return util.blend(hex, fg or util.fg, math.abs(amount)) end

function util.brighten(color, percentage)
  local hsl = hsluv.hex_to_hsluv(color)
  local larpSpace = 100 - hsl[3]
  if percentage < 0 then larpSpace = hsl[3] end
  hsl[3] = hsl[3] + larpSpace * percentage
  return hsluv.hsluv_to_hex(hsl)
end

function util.invertColor(color)
  if color ~= "NONE" then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[3] = 100 - hsl[3]
    if hsl[3] < 40 then hsl[3] = hsl[3] + (100 - hsl[3]) * 0.3 end
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

function util.randomColor(color)
  if color ~= "NONE" then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[1] = math.random(1, 360)
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

function util.getColor(color)
  if vim.o.background == "dark" then return color end
  if not util.colorCache[color] then util.colorCache[color] = util.invertColor(color) end
  return util.colorCache[color]
end

-- local ns = vim.api.nvim_create_namespace("gruvbox")
function util.highlight(group, color)
  if color.fg then util.colorsUsed[color.fg] = true end
  if color.bg then util.colorsUsed[color.bg] = true end
  if color.sp then util.colorsUsed[color.sp] = true end

  local style = color.style and "gui=" .. color.style or "gui=NONE"
  local fg = color.fg and "guifg=" .. util.getColor(color.fg) or "guifg=NONE"
  local bg = color.bg and "guibg=" .. util.getColor(color.bg) or "guibg=NONE"
  local sp = color.sp and "guisp=" .. util.getColor(color.sp) or ""

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  else
    -- local data = {}
    -- if color.fg then data.foreground = color.fg end
    -- if color.bg then data.background = color.bg end
    -- if color.sp then data.special = color.sp end
    -- if color.style then data[color.style] = true end
    -- vim.api.nvim_set_hl(ns, group, data)
    vim.cmd(hl)
  end
end

function util.debug(colors)
  colors = colors or require("gruvbox.colors")
  -- Dump unused colors
  for name, color in pairs(colors) do
    if type(color) == "table" then
      util.debug(color)
    else
      if util.colorsUsed[color] == nil then print("not used: " .. name .. " : " .. color) end
    end
  end
end

--- Delete the autocmds when the theme changes to something else
function util.onColorScheme()
  if vim.g.colors_name ~= "gruvbox-flat" then
    vim.cmd([[autocmd! gruvbox]])
    vim.cmd([[augroup! gruvbox]])
  end
end

---@param config Config
function util.autocmds(config)
  vim.cmd([[augroup gruvbox]])
  vim.cmd([[  autocmd!]])
  vim.cmd([[  autocmd ColorScheme * lua require("gruvbox.util").onColorScheme()]])
  if config.dev then
    vim.cmd([[  autocmd BufWritePost */lua/gruvbox/** nested colorscheme gruvbox-flat]])
  end
  for _, sidebar in ipairs(config.sidebars) do
    if sidebar == "terminal" then
      vim.cmd([[  autocmd TermOpen * setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]])
    else
      vim.cmd([[  autocmd FileType ]] .. sidebar ..
                [[ setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]])
    end
  end
  vim.cmd([[augroup end]])
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
function util.template(str, table)
  return (str:gsub("($%b{})", function(w) return table[w:sub(3, -2)] or w end))
end

function util.syntax(syntax) for group, colors in pairs(syntax) do util.highlight(group, colors) end end

---@param colors ColorScheme
function util.terminal(colors)
  local dark = colors.comment
  -- dark
  vim.g.terminal_color_0 = dark
  vim.g.terminal_color_8 = dark

  -- light
  vim.g.terminal_color_7 = colors.fg_dark
  vim.g.terminal_color_15 = colors.fg

  -- colors
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_9 = colors.red

  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_10 = colors.green

  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_11 = colors.yellow

  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_12 = colors.blue

  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_13 = colors.purple

  vim.g.terminal_color_6 = colors.aqua
  vim.g.terminal_color_14 = colors.aqua

  if vim.o.background == "light" then
    for i = 0, 15, 1 do
      vim.g["terminal_color_" .. i] = util.getColor(vim.g["terminal_color_" .. i])
    end
  end
end

function util.light_colors(colors)
  if type(colors) == "string" then return util.getColor(colors) end
  local ret = {}
  for key, value in pairs(colors) do ret[key] = util.light_colors(value) end
  return ret
end

---@param theme Theme
function util.load(theme)
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end

  vim.o.termguicolors = true
  vim.g.colors_name = "gruvbox-flat"
  -- vim.api.nvim__set_hl_ns(ns)
  -- load base theme
  util.syntax(theme.base)

  -- load syntax for plugins and terminal async
  util.terminal(theme.colors)
  util.syntax(theme.plugins)
  util.autocmds(theme.config)

  -- link to new tree-sitter highlight groups
  if vim.fn.has('nvim-0.8.0') == 1 then
    vim.cmd('highlight! link @constant TSConstant')
    vim.cmd('highlight! link @constructor TSConstructor')
    vim.cmd('highlight! link @field TSField')
    vim.cmd('highlight! link @include TSInclude')
    vim.cmd('highlight! link @keyword TSKeyword')
    vim.cmd('highlight! link @keyword.function TSKeywordFunction')
    vim.cmd('highlight! link @label TSLabel')
    vim.cmd('highlight! link @namespace TSNamespace')
    vim.cmd('highlight! link @operator TSOperator')
    vim.cmd('highlight! link @parameter TSParameter')
    vim.cmd('highlight! link @property TSProperty')
    vim.cmd('highlight! link @punctuation.bracket TSPunctBracket')
    vim.cmd('highlight! link @punctuation.delimiter TSPunctDelimiter')
    vim.cmd('highlight! link @punctuation.special TSPunctSpecial')
    vim.cmd('highlight! link @string.escape TSStringEscape')
    vim.cmd('highlight! link @string.regex TSStringRegex')
    vim.cmd('highlight! link @tag TSTag')
    vim.cmd('highlight! link @text.danger TSDanger')
    vim.cmd('highlight! link @text.note TSNote')
    vim.cmd('highlight! link @text.reference TSTextReference')
    vim.cmd('highlight! link @text.warning TSWarning')
    vim.cmd('highlight! link @variable TSVariable')
    vim.cmd('highlight! link @variable.builtin TSVariableBuiltin')
  end
end

---@param colors ColorScheme
---@param color_spec String
function util.new_color(colors, color_spec)
  if string.sub(color_spec, 1, 1) == "#" then
    -- hex override
    return color_spec
  else
    -- another group
    if not colors[color_spec] then error("Color " .. color_spec .. " does not exist") end
    return colors[color_spec]
  end
end

---@param config Config
---@param colors ColorScheme
function util.color_overrides(colors, config)
  if type(config.colors) == "table" then
    for key, value in pairs(config.colors) do
      if not colors[key] then error("Color " .. key .. " does not exist") end
      colors[key] = util.new_color(colors, value)
    end
  end
end

---@param config Config
---@param theme Theme
function util.theme_overrides(theme, config)
  if type(config.theme) ~= "table" then return nil end

  for theme_name, theme_override in pairs(config.theme) do
    if type(theme_override) ~= "table" then
      error("A theme override for " .. theme_name
            .. " should be a table but was " .. type(theme_override))
    end

    local theme_to_override;
    if theme.base[theme_name] then
      theme_to_override = theme.base[theme_name]
    elseif theme.plugins[theme_name] then
      theme_to_override = theme.plugins[theme_name]
    else
      error("Theme " .. theme_name .. " does not exist")
    end

    for field_name, field_color in pairs(theme_override) do
      theme_to_override[field_name] = util.new_color(theme.colors, field_color)
    end
  end
end

function util.light(brightness)
  for hl_name, hl in pairs(vim.api.nvim__get_hl_defs(0)) do
    local def = {}
    for key, def_key in pairs({ foreground = "fg", background = "bg", special = "sp" }) do
      if type(hl[key]) == "number" then
        local hex = string.format("#%06x", hl[key])
        local color = util.invertColor(hex)
        if brightness then color = util.brighten(hex, brightness) end
        table.insert(def, "gui" .. def_key .. "=" .. color)
      end
    end
    if hl_name ~= "" and #def > 0 then
      for _, style in pairs({ "bold", "italic", "underline", "undercurl", "reverse" }) do
        if hl[style] then table.insert(def, "gui=" .. style) end
      end

      vim.cmd("highlight! " .. hl_name .. " " .. table.concat(def, " "))
    end
  end
end

function util.random()
  local colors = {}
  for hl_name, hl in pairs(vim.api.nvim__get_hl_defs(0)) do
    local def = {}
    for key, def_key in pairs({ foreground = "fg", background = "bg", special = "sp" }) do
      if type(hl[key]) == "number" then
        local hex = string.format("#%06x", hl[key])
        local color = colors[hex] and colors[hex] or util.randomColor(hex)
        colors[hex] = color
        table.insert(def, "gui" .. def_key .. "=" .. color)
      end
    end
    if hl_name ~= "" and #def > 0 then
      for _, style in pairs({ "bold", "italic", "underline", "undercurl", "reverse" }) do
        if hl[style] then table.insert(def, "gui=" .. style) end
      end

      vim.cmd("highlight! " .. hl_name .. " " .. table.concat(def, " "))
    end
  end
end

return util
